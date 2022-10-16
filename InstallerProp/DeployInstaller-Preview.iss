; Script generated by the Inno Script Studio Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
AppName=Collapse
AppVersion=1.0.52.1
AppCopyright=2022 - neon-nyan
AppPublisher=neon-nyan
VersionInfoVersion=1.0.52.1
VersionInfoCompany=neon-nyan
VersionInfoDescription=Collapse - An advanced launcher for miHoYo Games
VersionInfoCopyright=2022 - neon-nyan
VersionInfoProductName=Collapse
VersionInfoProductVersion=1.0.52.1
VersionInfoProductTextVersion=1.0.52.1-preview
SolidCompression=True
Compression=lzma2/ultra64
InternalCompressLevel=ultra64
MinVersion=0,10.0.17763
DefaultDirName={autopf64}\Collapse Launcher\
DefaultGroupName=Collapse
UninstallDisplayName=Collapse
UninstallDisplayIcon={app}\CollapseLauncher.exe
WizardStyle=modern
WizardImageFile=..\InstallerProp\WizardBannerDesign.bmp
WizardSmallImageFile=..\InstallerProp\WizardBannerDesignSmall.bmp
DisableWelcomePage=False
ArchitecturesInstallIn64BitMode=x64
LicenseFile=..\LICENSE
SetupIconFile=..\CollapseLauncher\icon.ico
LZMAUseSeparateProcess=yes
LZMADictionarySize=1048576
LZMAMatchFinder=BT
LZMANumFastBytes=128

[Icons]
Name: "{group}\Collapse Launcher\Collapse"; Filename: "{app}\CollapseLauncher.exe"; WorkingDir: "{app}"; IconFilename: "{app}\CollapseLauncher.exe"; IconIndex: 0
Name: "{group}\Collapse Launcher\Collapse (Hi3 Cache Updater)"; Filename: "{app}\CollapseLauncher.Hi3CacheUpdater.cmd"; WorkingDir: "{app}"; IconFilename: "{app}\CollapseLauncher.exe"; IconIndex: 0
Name: "{userdesktop}\Collapse"; Filename: "{app}\CollapseLauncher.exe"; WorkingDir: "{app}"; IconFilename: "{app}\CollapseLauncher.exe"; IconIndex: 0

[Files]
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\*"; DestDir: "{app}"; Flags: ignoreversion createallsubdirs recursesubdirs
