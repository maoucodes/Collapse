﻿using CollapseLauncher.GameVersioning;
using CollapseLauncher.InstallManager.Base;
using CollapseLauncher.Interfaces;
using Hi3Helper;
using Hi3Helper.Shared.ClassStruct;
using Microsoft.UI.Xaml;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using static CollapseLauncher.Dialogs.SimpleDialogs;
using static Hi3Helper.Locale;
using static Hi3Helper.Logger;

namespace CollapseLauncher.InstallManager.Genshin
{
    internal class GenshinInstall : InstallManagerBase<GameTypeGenshinVersion>, IGameInstallManager
    {
        #region Override Properties
        protected override int _gameVoiceLanguageID { get => _gameVersionManager.GamePreset.GetVoiceLanguageID(); }
        #endregion

        #region Properties
        protected override string _gameAudioLangListPath
        {
            get
            {
                // If the persistent folder is not exist, then return null
                if (!Directory.Exists(_gameDataPersistentPath)) return null;

                // Try get the file list
                string[] audioPath = Directory.GetFiles(_gameDataPersistentPath, "audio_lang_*", SearchOption.TopDirectoryOnly);
                // If the path is null or has no length, then return null
                if (audioPath == null || audioPath.Length == 0)
                {
                    return null;
                }

                // If not, then return the first path
                return audioPath[0];
            }
        }
        protected override string _gameAudioLangListPathStatic { get => Path.Combine(_gameDataPersistentPath, "audio_lang_14"); }
        private string _gameAudioNewPath { get => Path.Combine(_gameDataPath, "StreamingAssets", "AudioAssets"); }
        private string _gameAudioOldPath { get => Path.Combine(_gameDataPath, "StreamingAssets", "Audio", "GeneratedSoundBanks", "Windows"); }
        #endregion

        public GenshinInstall(UIElement parentUI, IGameVersionCheck GameVersionManager)
            : base(parentUI, GameVersionManager)
        {

        }

        #region Public Methods
        public override async ValueTask<bool> IsPreloadCompleted(CancellationToken token)
        {
            // Get the primary file first check
            List<RegionResourceVersion> resource = _gameVersionManager.GetGamePreloadZip();

            // Sanity Check: throw if resource returns null
            if (resource == null) throw new InvalidOperationException($"You're trying to check this method while preload is not available!");

            bool primaryAsset = resource.All(x =>
            {
                string name = Path.GetFileName(x.path);
                string path = Path.Combine(_gamePath, name);

                return File.Exists(path);
            });

            // Get the second voice pack check
            List<GameInstallPackage> voicePackList = new List<GameInstallPackage>();

            // Add another voice pack that already been installed
            TryAddOtherInstalledVoicePacks(resource.FirstOrDefault().voice_packs, voicePackList, resource.FirstOrDefault().version);

            // Get the secondary file check
            bool secondaryAsset = voicePackList.All(x => File.Exists(x.PathOutput));

            return (primaryAsset && secondaryAsset) || await base.IsPreloadCompleted(token);
        }
        #endregion

        #region Override Methods - StartPackageInstallationInner
        protected override async Task StartPackageInstallationInner(List<GameInstallPackage> gamePackage = null, bool isOnlyInstallPackage = false, bool doNotDeleteZipExplicit = false)
        {
            if (!isOnlyInstallPackage)
                // Starting from 3.6 update, the Audio files have been moved to "AudioAssets" folder
                EnsureMoveOldToNewAudioDirectory();

            // Run the base installation process
            await base.StartPackageInstallationInner(gamePackage);

            // Then start on processing hdifffiles list and deletefiles list
            await ApplyHdiffListPatch();
            ApplyDeleteFileAction();
        }

        protected void EnsureMoveOldToNewAudioDirectory()
        {
            // Return if the old path doesn't exist
            if (!Directory.Exists(_gameAudioOldPath)) return;

            // If it exists, then enumerate the content of it and do move operation
            int offset = _gameAudioOldPath.Length + 1;
            foreach (string oldPath in Directory.EnumerateFiles(_gameAudioOldPath, "*", SearchOption.AllDirectories))
            {
                string basePath = oldPath.AsSpan().Slice(offset).ToString();
                string newPath = Path.Combine(_gameAudioNewPath, basePath);
                string newFolder = Path.GetDirectoryName(newPath);

                if (!Directory.Exists(newFolder))
                {
                    Directory.CreateDirectory(newFolder);
                }

                FileInfo oldFileInfo = new FileInfo(oldPath);
                oldFileInfo.IsReadOnly = false;
                oldFileInfo.MoveTo(newPath, true);
            }

            try
            {
                // Then if all the files are already moved, delete the old path
                if (Directory.Exists(_gameAudioOldPath))
                {
                    Directory.CreateDirectory(_gameAudioOldPath);
                }
            }
            catch (Exception ex)
            {
                LogWriteLine($"Failed while deleting old audio folder: {_gameAudioOldPath}\r\n{ex}", LogType.Error, true);
            }
        }
        #endregion

        #region Override Methods - GetInstallationPath
        protected override async ValueTask<bool> TryAddResourceVersionList(
            RegionResourceVersion asset, List<GameInstallPackage> packageList, bool isSkipMainPackage = false)
        {
            // Do action from base method first
            if (!await base.TryAddResourceVersionList(asset, packageList, isSkipMainPackage)) return false;

            // Initialize langID
            int langID;

            // Get available language names
            List<string> langStrings = EnumerateAudioLanguageString(asset);
            GameInstallPackage package;

            // Skip if the asset doesn't have voice packs
            if (asset.voice_packs == null || asset.voice_packs.Count == 0)
            {
                LogWriteLine($"Asset for version: {asset.version} doesn't have voice packs! Skipping!", LogType.Warning, true);
                return true;
            }

            // If the game has already installed or in preload, then try get Voice language ID from registry
            GameInstallStateEnum gameState = await _gameVersionManager.GetGameState();
            if (gameState == GameInstallStateEnum.InstalledHavePreload
             || gameState == GameInstallStateEnum.NeedsUpdate)
            {
                // Try get the voice language ID from the registry
                langID = _gameVoiceLanguageID;
                package = new GameInstallPackage(asset.voice_packs[langID], _gamePath, asset.version)
                    { LanguageID = langID, PackageType = GameInstallPackageType.Audio };
                packageList.Add(package);

                // Also try add another voice pack that already been installed
                TryAddOtherInstalledVoicePacks(asset.voice_packs, packageList, asset.version);
            }
            // Else, show dialog to choose the language ID to be installed
            else
            {
                (List<int> addedVO, int setAsDefaultVO) = await Dialog_ChooseAudioLanguageChoice(_parentUI, langStrings, 2);
                if (addedVO == null || setAsDefaultVO < 0)
                    throw new TaskCanceledException();

                for (int i = 0; i < addedVO.Count; i++)
                {
                    langID = addedVO[i];
                    package = new GameInstallPackage(asset.voice_packs[langID], _gamePath, asset.version) { LanguageID = langID, PackageType = GameInstallPackageType.Audio };
                    packageList.Add(package);

                    LogWriteLine($"Adding primary {package.LanguageName} audio package: {package.Name} to the list (Hash: {package.HashString})", LogType.Default, true);
                }

                // Set the voice language ID to value given
                _gameVersionManager.GamePreset.SetVoiceLanguageID(setAsDefaultVO);
            }

            return true;
        }
        #endregion
        #region Private Methods - GetInstallationPath
        private List<string> EnumerateAudioLanguageString(RegionResourceVersion diffVer)
        {
            List<string> value = new List<string>();
            foreach (RegionResourceVersion Entry in diffVer.voice_packs)
            {
                // Check the lang ID and add the translation of the language to the list
                value.Add(Entry.language switch
                {
                    "en-us" => Lang._Misc.LangNameENUS,
                    "ja-jp" => Lang._Misc.LangNameJP,
                    "zh-cn" => Lang._Misc.LangNameCN,
                    "ko-kr" => Lang._Misc.LangNameKR,
                    _ => Entry.language
                });
            }
            return value;
        }

        private void TryAddOtherInstalledVoicePacks(IList<RegionResourceVersion> packs, List<GameInstallPackage> packageList, string assetVersion)
        {
            // If not found (null), then return
            if (_gameAudioLangListPath == null) return;

            // Start read the file
            using (StreamReader sw = new StreamReader(_gameAudioLangListPath))
            {
                while (!sw.EndOfStream)
                {
                    // Get the line
                    string langStr = sw.ReadLine();

                    // Get the key value pair for the respective value
                    KeyValuePair<string, int> langKey = langStr switch
                    {
                        "Chinese" => new KeyValuePair<string, int>("zh-cn", 0),
                        "English(US)" => new KeyValuePair<string, int>("en-us", 1),
                        "Japanese" => new KeyValuePair<string, int>("ja-jp", 2),
                        "Korean" => new KeyValuePair<string, int>("ko-kr", 3),
                        _ => throw new KeyNotFoundException($"Key: {langStr} is not supported!")
                    };

                    // Add the voice language to the list
                    TryAddOtherVoicePacksDictionary(langKey.Key, packs[langKey.Value], langKey.Value, packageList, assetVersion);
                }
            }
        }

        private void TryAddOtherVoicePacksDictionary(string key, RegionResourceVersion value, int langID,
                                                     List<GameInstallPackage> packageList, string assetVersion)
        {
            // Try check if the package list matches the key
            if (!packageList.Any(x => x.LanguageName == key))
            {
                // Then add to the package list
                value.languageID = langID;
                GameInstallPackage package = new GameInstallPackage(value, _gamePath, assetVersion)
                    { LanguageID = langID, PackageType = GameInstallPackageType.Audio };
                packageList.Add(package);

                LogWriteLine($"Adding additional {package.LanguageName} audio package: {package.Name} to the list (Hash: {package.HashString})",
                             LogType.Default, true);
            }
        }
        #endregion

        #region Override Methods - UninstallGame
        protected override UninstallGameProperty AssignUninstallFolders()
        {
            string execName = _gameVersionManager.GamePreset.ZoneName switch
            {
                "Global" => "GenshinImpact",
                "Mainland China" => "YuanShen",
                _ => throw new NotSupportedException($"Unknown GI Game Region!: {_gameVersionManager.GamePreset.ZoneName}")
            };

            return new UninstallGameProperty
            {
                gameDataFolderName  = $"{execName}_Data",
                foldersToDelete     = new[] { $"{execName}_Data" },
                filesToDelete       = new[] { "HoYoKProtect.sys", "pkg_version", $"{execName}.exe", "UnityPlayer.dll", "config.ini", "^mhyp.*", "^Audio.*" },
                foldersToKeepInData = Array.Empty<string>()
            };
        }
        #endregion
    }
}
