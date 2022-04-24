; Script generated by the Inno Script Studio Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
AppName=Collapse Launcher
AppVersion=1.0.12.0
AppCopyright=2022 - neon-nyan
AppPublisher=neon-nyan
VersionInfoVersion=1.0.12.0
VersionInfoCompany=neon-nyan
VersionInfoDescription=Collapse Launcher - An advanced launcher for Honkai Impact 3rd
VersionInfoCopyright=2022 - neon-nyan
VersionInfoProductName=Collapse Launcher
VersionInfoProductVersion=1.0.12.0
VersionInfoProductTextVersion=1.0.12.0-preview
SolidCompression=True
Compression=lzma2/ultra64
InternalCompressLevel=ultra64
MinVersion=0,10.0.17763
DefaultDirName={autopf64}\Collapse Launcher\
DefaultGroupName=Collapse Launcher
UninstallDisplayName=Collapse Launcher
UninstallDisplayIcon={app}\CollapseLauncher.exe
WizardStyle=modern
WizardImageFile=..\InstallerProp\WizardBannerDesign.bmp
WizardSmallImageFile=..\InstallerProp\WizardBannerDesignSmall.bmp
DisableWelcomePage=False
ArchitecturesInstallIn64BitMode=x64
LicenseFile=..\LICENSE

[Files]
Source: "..\build\prequesties\Install.bat"; DestDir: "{app}\prequesties"; Flags: ignoreversion
Source: "..\build\prequesties\WindowsAppSDK-Installer-x64\InstallRuntime.ps1"; DestDir: "{app}\prequesties\WindowsAppSDK-Installer-x64"; Flags: ignoreversion
Source: "..\build\prequesties\WindowsAppSDK-Installer-x64\RemoveRuntime.ps1"; DestDir: "{app}\prequesties\WindowsAppSDK-Installer-x64"; Flags: ignoreversion
Source: "..\build\prequesties\WindowsAppSDK-Installer-x64\win10-x64\Microsoft.WindowsAppRuntime.1.1-preview2.msix"; DestDir: "{app}\prequesties\WindowsAppSDK-Installer-x64\win10-x64"; Flags: ignoreversion
Source: "..\build\prequesties\WindowsAppSDK-Installer-x64\win10-x64\Microsoft.WindowsAppRuntime.DDLM.1.1-preview2.msix"; DestDir: "{app}\prequesties\WindowsAppSDK-Installer-x64\win10-x64"; Flags: ignoreversion
Source: "..\build\prequesties\WindowsAppSDK-Installer-x64\win10-x64\Microsoft.WindowsAppRuntime.Main.1.1-preview2.msix"; DestDir: "{app}\prequesties\WindowsAppSDK-Installer-x64\win10-x64"; Flags: ignoreversion
Source: "..\build\prequesties\WindowsAppSDK-Installer-x64\win10-x64\Microsoft.WindowsAppRuntime.Singleton.1.1-preview2.msix"; DestDir: "{app}\prequesties\WindowsAppSDK-Installer-x64\win10-x64"; Flags: ignoreversion
Source: "..\build\prequesties\WindowsAppSDK-Installer-x64\win10-x64\MSIX.inventory"; DestDir: "{app}\prequesties\WindowsAppSDK-Installer-x64\win10-x64"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\Aiursoft.HSharp.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\CollapseLauncher.deps.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\CollapseLauncher.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\CollapseLauncher.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\CollapseLauncher.Invoker.deps.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\CollapseLauncher.Invoker.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\CollapseLauncher.Invoker.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\CollapseLauncher.Invoker.runtimeconfig.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\CollapseLauncher.pdb"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\CollapseLauncher.runtimeconfig.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\CollapseLauncher.Updater.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\ColorCode.Core.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\ColorCode.WinUI.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\ColorThief.Netstandard.v20.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\CommunityToolkit.Common.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\CommunityToolkit.WinUI.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\CommunityToolkit.WinUI.UI.Controls.Core.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\CommunityToolkit.WinUI.UI.Controls.DataGrid.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\CommunityToolkit.WinUI.UI.Controls.Input.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\CommunityToolkit.WinUI.UI.Controls.Layout.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\CommunityToolkit.WinUI.UI.Controls.Markdown.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\CommunityToolkit.WinUI.UI.Controls.Media.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\CommunityToolkit.WinUI.UI.Controls.Primitives.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\CommunityToolkit.WinUI.UI.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\Crc32.NET.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\Google.Protobuf.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\Hi3HelperCore.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\Hi3HelperCore.pdb"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\Microsoft.Graphics.Canvas.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\Microsoft.Graphics.Canvas.Interop.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\Microsoft.InteractiveExperiences.Projection.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\Microsoft.Win32.SystemEvents.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\Microsoft.Windows.ApplicationModel.DynamicDependency.Projection.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\Microsoft.Windows.ApplicationModel.Resources.Projection.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\Microsoft.Windows.ApplicationModel.WindowsAppRuntime.Projection.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\Microsoft.Windows.AppLifecycle.Projection.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\Microsoft.Windows.AppNotifications.Projection.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\Microsoft.Windows.PushNotifications.Projection.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\Microsoft.Windows.SDK.NET.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\Microsoft.Windows.System.Power.Projection.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\Microsoft.Windows.System.Projection.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\Microsoft.WindowsAppRuntime.Bootstrap.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\Microsoft.WindowsAppRuntime.Bootstrap.Net.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\Microsoft.WinUI.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\Newtonsoft.Json.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\PInvoke.Kernel32.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\PInvoke.User32.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\PInvoke.Windows.Core.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\PInvoke.Windows.ShellScalingApi.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\resources.pri"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\SharpCompress.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\System.Drawing.Common.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\Validation.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\WinRT.Runtime.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\Lib\7z.dll"; DestDir: "{app}\Lib"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\Lib\HPatchZ.dll"; DestDir: "{app}\Lib"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\Assets\ironmaiden_logo_256.png"; DestDir: "{app}\Assets"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\Assets\BG\AiHappy.png"; DestDir: "{app}\Assets\BG"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\Assets\BG\default.png"; DestDir: "{app}\Assets\BG"; Flags: ignoreversion
Source: "..\..\CollapseLauncher-ReleaseRepo\preview\config\fileconfig.json"; DestDir: "{app}\config"; Flags: ignoreversion

[Icons]
Name: "{group}\Collapse Launcher\Collapse Launcher"; Filename: "{app}\CollapseLauncher.exe"; WorkingDir: "{app}"; IconFilename: "{app}\CollapseLauncher.exe"; IconIndex: 0
Name: "{userdesktop}\Collapse Launcher"; Filename: "{app}\CollapseLauncher.exe"; WorkingDir: "{app}"; IconFilename: "{app}\CollapseLauncher.exe"; IconIndex: 0

[PreCompile]
Name: "{app}\prequesties"
Name: "{app}\prequesties\WindowsAppSDK-Installer-x64"

Name: "{app}\Lib"
Name: "{app}\Assets"
Name: "{app}\Assets\BG"
Name: "{app}\config"

[Run]
Filename: "{app}\prequesties\Install.bat"; Description: "Install Prequesties (Mandatory)"
