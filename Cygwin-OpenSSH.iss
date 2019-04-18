#define MyAppName "Cygwin OpenSSH"
#define MyAppShortName "CygOpenSSH"
#define MyAppVersion "8.0.0"
#define MySetupName "Cygwin-OpenSSH"
#define MySetupVersion "0.0.1.0"
#define MySetupCompany "Bill Stewart (bstewart@iname.com)"
#define MyIconFilename "OpenSSH.ico"
#define S4ULogonFixTaskCaption "Implement MsV1_0S4ULogon fix"

[Setup]
AppId={{10B451EB-9806-4728-B93E-5FE2B7C33E10}
AppPublisher=Bill Stewart
ArchitecturesInstallIn64BitMode=x64
AppName={#MyAppName}
AppVersion={#MyAppVersion}
ChangesEnvironment=yes
PrivilegesRequired=admin
DefaultDirName={pf}\{#MyAppShortName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
LicenseFile=
MinVersion=6
OutputDir=.
OutputBaseFilename={#MySetupName}_{#MyAppVersion}
Compression=lzma2/max
SolidCompression=yes
SetupIconFile={#MyIconFilename}
UninstallDisplayIcon={app}\{#MyIconFilename}
VersionInfoVersion={#MySetupVersion}
VersionInfoCompany={#MySetupCompany}
VersionInfoProductVersion={#MyAppVersion}
WizardSmallImageFile=OpenSSH-55x55.bmp

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl,Messages.isl"; LicenseFile: "license.rtf"; InfoBeforeFile: "readme.rtf"

[Types]
Name: "full";   Description: "Full installation (server and client files)"
Name: "client"; Description: "Client installation (client files only)"

[Components]
Name: "server"; Description: "Server and client files"; Types: full;   Flags: disablenouninstallwarning
Name: "client"; Description: "Client files only";       Types: client; Flags: fixed

[Files]
; x64 - /bin
Source: "bin\*.dll";               DestDir: "{app}\bin"; Check: Is64BitInstallMode; Components: client server
Source: "bin\cygpath.exe";         DestDir: "{app}\bin"; Check: Is64BitInstallMode; Components: client server
Source: "bin\cygrunsrv.exe";       DestDir: "{app}\bin"; Check: Is64BitInstallMode; Components: client server
Source: "bin\cygstart.exe";        DestDir: "{app}\bin"; Check: Is64BitInstallMode; Components: client server
Source: "bin\editrights.exe";      DestDir: "{app}\bin"; Check: Is64BitInstallMode; Components: client server
Source: "bin\false.exe";           DestDir: "{app}\bin"; Check: Is64BitInstallMode; Components: client server
Source: "bin\getent.exe";          DestDir: "{app}\bin"; Check: Is64BitInstallMode; Components: client server
Source: "bin\id.exe";              DestDir: "{app}\bin"; Check: Is64BitInstallMode; Components: client server
Source: "bin\less.exe";            DestDir: "{app}\bin"; Check: Is64BitInstallMode; Components: client server
Source: "bin\mount.exe";           DestDir: "{app}\bin"; Check: Is64BitInstallMode; Components: client server
Source: "bin\nano.exe";            DestDir: "{app}\bin"; Check: Is64BitInstallMode; Components: client server
Source: "bin\passwd.exe";          DestDir: "{app}\bin"; Check: Is64BitInstallMode; Components: client server
Source: "bin\ps1exec.exe";         DestDir: "{app}\bin"; Check: Is64BitInstallMode; Components: client server
Source: "bin\rebase.exe";          DestDir: "{app}\bin"; Check: Is64BitInstallMode; Components: client server
Source: "bin\rsync.exe";           DestDir: "{app}\bin"; Check: Is64BitInstallMode; Components: client server
Source: "bin\scp.exe";             DestDir: "{app}\bin"; Check: Is64BitInstallMode; Components: client server
Source: "bin\setacl.exe";          DestDir: "{app}\bin"; Check: Is64BitInstallMode; Components: client server
Source: "bin\sftp.exe";            DestDir: "{app}\bin"; Check: Is64BitInstallMode; Components: client server
Source: "bin\ssh-add.exe";         DestDir: "{app}\bin"; Check: Is64BitInstallMode; Components: client server
Source: "bin\ssh-agent.exe";       DestDir: "{app}\bin"; Check: Is64BitInstallMode; Components: client server
Source: "bin\ssh-keygen.exe";      DestDir: "{app}\bin"; Check: Is64BitInstallMode; Components: client server
Source: "bin\ssh-keyscan.exe";     DestDir: "{app}\bin"; Check: Is64BitInstallMode; Components: client server
Source: "bin\ssh.exe";             DestDir: "{app}\bin"; Check: Is64BitInstallMode; Components: client server
Source: "bin\touch.exe";           DestDir: "{app}\bin"; Check: Is64BitInstallMode; Components: client server
Source: "bin\true.exe";            DestDir: "{app}\bin"; Check: Is64BitInstallMode; Components: client server
Source: "bin\umount.exe";          DestDir: "{app}\bin"; Check: Is64BitInstallMode; Components: client server
Source: "bin\uname.exe";           DestDir: "{app}\bin"; Check: Is64BitInstallMode; Components: client server
Source: "bin\unzip.exe";           DestDir: "{app}\bin"; Check: Is64BitInstallMode; Components: client server
Source: "bin\vi.exe";              DestDir: "{app}\bin"; Check: Is64BitInstallMode; Components: client server
Source: "bin\xz.exe";              DestDir: "{app}\bin"; Check: Is64BitInstallMode; Components: client server
Source: "bin\zip.exe";             DestDir: "{app}\bin"; Check: Is64BitInstallMode; Components: client server
Source: "bin\dash.exe";            DestDir: "{app}\bin"; Check: Is64BitInstallMode; Components: server
Source: "bin\posh.exe";            DestDir: "{app}\bin"; Check: Is64BitInstallMode; Components: server
Source: "bin\tty.exe";             DestDir: "{app}\bin"; Check: Is64BitInstallMode; Components: server
Source: "bin\winpty-agent.exe";    DestDir: "{app}\bin"; Check: Is64BitInstallMode; Components: server
Source: "bin\winpty.exe";          DestDir: "{app}\bin"; Check: Is64BitInstallMode; Components: server
; x64 - /usr/sbin
Source: "usr\sbin\ssh-keysign.exe";       DestDir: "{app}\usr\sbin"; Check: Is64BitInstallMode; Components: client server
Source: "usr\sbin\ssh-pkcs11-helper.exe"; DestDir: "{app}\usr\sbin"; Check: Is64BitInstallMode; Components: client server
Source: "usr\sbin\cygserver.exe";         DestDir: "{app}\usr\sbin"; Check: Is64BitInstallMode; Components: client server
Source: "usr\sbin\sftp-server.exe";       DestDir: "{app}\usr\sbin"; Check: Is64BitInstallMode; Components: server
Source: "usr\sbin\sshd.exe";              DestDir: "{app}\usr\sbin"; Check: Is64BitInstallMode; Components: server
; x86 - /bin
Source: "bin32\*.dll";            DestDir: "{app}\bin"; Check: not Is64BitInstallMode; Components: client server; Flags: solidbreak
Source: "bin32\cygpath.exe";      DestDir: "{app}\bin"; Check: not Is64BitInstallMode; Components: client server
Source: "bin32\cygrunsrv.exe";    DestDir: "{app}\bin"; Check: not Is64BitInstallMode; Components: client server
Source: "bin32\cygstart.exe";     DestDir: "{app}\bin"; Check: not Is64BitInstallMode; Components: client server
Source: "bin32\editrights.exe";   DestDir: "{app}\bin"; Check: not Is64BitInstallMode; Components: client server
Source: "bin32\false.exe";        DestDir: "{app}\bin"; Check: not Is64BitInstallMode; Components: client server
Source: "bin32\getent.exe";       DestDir: "{app}\bin"; Check: not Is64BitInstallMode; Components: client server
Source: "bin32\id.exe";           DestDir: "{app}\bin"; Check: not Is64BitInstallMode; Components: client server
Source: "bin32\less.exe";         DestDir: "{app}\bin"; Check: not Is64BitInstallMode; Components: client server
Source: "bin32\mount.exe";        DestDir: "{app}\bin"; Check: not Is64BitInstallMode; Components: client server
Source: "bin32\nano.exe";         DestDir: "{app}\bin"; Check: not Is64BitInstallMode; Components: client server
Source: "bin32\passwd.exe";       DestDir: "{app}\bin"; Check: not Is64BitInstallMode; Components: client server
Source: "bin32\ps1exec.exe";      DestDir: "{app}\bin"; Check: not Is64BitInstallMode; Components: client server
Source: "bin32\rebase.exe";       DestDir: "{app}\bin"; Check: not Is64BitInstallMode; Components: client server
Source: "bin32\rsync.exe";        DestDir: "{app}\bin"; Check: not Is64BitInstallMode; Components: client server
Source: "bin32\scp.exe";          DestDir: "{app}\bin"; Check: not Is64BitInstallMode; Components: client server
Source: "bin32\setacl.exe";       DestDir: "{app}\bin"; Check: not Is64BitInstallMode; Components: client server
Source: "bin32\sftp.exe";         DestDir: "{app}\bin"; Check: not Is64BitInstallMode; Components: client server
Source: "bin32\ssh-add.exe";      DestDir: "{app}\bin"; Check: not Is64BitInstallMode; Components: client server
Source: "bin32\ssh-agent.exe";    DestDir: "{app}\bin"; Check: not Is64BitInstallMode; Components: client server
Source: "bin32\ssh-keygen.exe";   DestDir: "{app}\bin"; Check: not Is64BitInstallMode; Components: client server
Source: "bin32\ssh-keyscan.exe";  DestDir: "{app}\bin"; Check: not Is64BitInstallMode; Components: client server
Source: "bin32\ssh.exe";          DestDir: "{app}\bin"; Check: not Is64BitInstallMode; Components: client server
Source: "bin32\touch.exe";        DestDir: "{app}\bin"; Check: not Is64BitInstallMode; Components: client server
Source: "bin32\true.exe";         DestDir: "{app}\bin"; Check: not Is64BitInstallMode; Components: client server
Source: "bin32\umount.exe";       DestDir: "{app}\bin"; Check: not Is64BitInstallMode; Components: client server
Source: "bin32\uname.exe";        DestDir: "{app}\bin"; Check: not Is64BitInstallMode; Components: client server
Source: "bin32\unzip.exe";        DestDir: "{app}\bin"; Check: not Is64BitInstallMode; Components: client server
Source: "bin32\vi.exe";           DestDir: "{app}\bin"; Check: not Is64BitInstallMode; Components: client server
Source: "bin32\xz.exe";           DestDir: "{app}\bin"; Check: not Is64BitInstallMode; Components: client server
Source: "bin32\zip.exe";          DestDir: "{app}\bin"; Check: not Is64BitInstallMode; Components: client server
Source: "bin32\dash.exe";         DestDir: "{app}\bin"; Check: not Is64BitInstallMode; Components: server
Source: "bin32\posh.exe";         DestDir: "{app}\bin"; Check: not Is64BitInstallMode; Components: server
Source: "bin32\tty.exe";          DestDir: "{app}\bin"; Check: not Is64BitInstallMode; Components: server
Source: "bin32\winpty-agent.exe"; DestDir: "{app}\bin"; Check: not Is64BitInstallMode; Components: server
Source: "bin32\winpty.exe";       DestDir: "{app}\bin"; Check: not Is64BitInstallMode; Components: server
; x86 - /usr/sbin
Source: "usr\sbin32\ssh-keysign.exe";       DestDir: "{app}\usr\sbin"; Check: not Is64BitInstallMode; Components: client server
Source: "usr\sbin32\ssh-pkcs11-helper.exe"; DestDir: "{app}\usr\sbin"; Check: not Is64BitInstallMode; Components: client server
Source: "usr\sbin32\cygserver.exe";         DestDir: "{app}\usr\sbin"; Check: not Is64BitInstallMode; Components: client server
Source: "usr\sbin32\sftp-server.exe";       DestDir: "{app}\usr\sbin"; Check: not Is64BitInstallMode; Components: server
Source: "usr\sbin32\sshd.exe";              DestDir: "{app}\usr\sbin"; Check: not Is64BitInstallMode; Components: server
; shared - /
Source: "{#MyIconFilename}";  DestDir: "{app}"; Components: client server; Flags: solidbreak
Source: "Cygwin-OpenSSH.chm"; DestDir: "{app}"; Components: client server
Source: "Cygwin-OpenSSH.pdf"; DestDir: "{app}"; Components: client server
; shared - /bin
Source: "bin\Win32API.def";        DestDir: "{app}\bin"; Components: client server
Source: "bin\Edit-SSHKey.ps1";     DestDir: "{app}\bin"; Components: client server
Source: "bin\Get-AccountName.ps1"; DestDir: "{app}\bin"; Components: client server
Source: "bin\New-SSHKey.ps1";      DestDir: "{app}\bin"; Components: client server
Source: "bin\Set-FstabConfig.ps1"; DestDir: "{app}\bin"; Components: client server
Source: "bin\Set-SSHGroup.ps1";    DestDir: "{app}\bin"; Components: server
Source: "bin\Set-SSHHostKey.ps1";  DestDir: "{app}\bin"; Components: server
Source: "bin\Set-SSHService.ps1";  DestDir: "{app}\bin"; Components: server
Source: "bin\Set-S4ULogonFix.ps1"; DestDir: "{app}\bin"; Components: server; OnlyBelowVersion: 6.3
; shared - /etc
Source: "etc\nsswitch.conf";  DestDir: "{app}\etc"; Components: client server; Flags: onlyifdoesntexist uninsneveruninstall
Source: "etc\passwd";         DestDir: "{app}\etc"; Components: client server; Flags: onlyifdoesntexist uninsneveruninstall
Source: "etc\rsyncd.conf";    DestDir: "{app}\etc"; Components: client server; Flags: onlyifdoesntexist uninsneveruninstall
Source: "etc\rsyncd.secrets"; DestDir: "{app}\etc"; Components: client server; Flags: onlyifdoesntexist uninsneveruninstall
Source: "etc\ssh_config";     DestDir: "{app}\etc"; Components: client server; Flags: onlyifdoesntexist uninsneveruninstall
Source: "etc\moduli";         DestDir: "{app}\etc"; Components: server;        Flags: onlyifdoesntexist
Source: "etc\banner.txt";     DestDir: "{app}\etc"; Components: server;        Flags: onlyifdoesntexist uninsneveruninstall
Source: "etc\profile";        DestDir: "{app}\etc"; Components: server;        Flags: onlyifdoesntexist uninsneveruninstall
Source: "etc\sshd_config";    DestDir: "{app}\etc"; Components: server;        Flags: onlyifdoesntexist uninsneveruninstall
; shared - /etc/defaults/etc
Source: "etc\defaults\etc\nsswitch.conf";  DestDir: "{app}\etc\defaults\etc"; Components: client server
Source: "etc\defaults\etc\passwd";         DestDir: "{app}\etc\defaults\etc"; Components: client server
Source: "etc\defaults\etc\rsyncd.conf";    DestDir: "{app}\etc\defaults\etc"; Components: client server
Source: "etc\defaults\etc\rsyncd.secrets"; DestDir: "{app}\etc\defaults\etc"; Components: client server
Source: "etc\defaults\etc\ssh_config";     DestDir: "{app}\etc\defaults\etc"; Components: client server
Source: "etc\defaults\etc\banner.txt";     DestDir: "{app}\etc\defaults\etc"; Components: server
Source: "etc\defaults\etc\profile";        DestDir: "{app}\etc\defaults\etc"; Components: server
Source: "etc\defaults\etc\sshd_config";    DestDir: "{app}\etc\defaults\etc"; Components: server
; shared - /usr
Source: "usr\share\doc\*";      DestDir: "{app}\usr\share\doc";      Components: client server; Flags: recursesubdirs
Source: "usr\share\terminfo\*"; DestDir: "{app}\usr\share\terminfo"; Components: server;        Flags: recursesubdirs createallsubdirs
Source: "usr\src\*";            DestDir: "{app}\usr\src";            Components: server;        Flags: recursesubdirs
; shared - /users
Source: "users\SYSTEM\.ssh\*"; DestDir: "{app}\users\SYSTEM\.ssh"; Components: server; Flags: uninsneveruninstall
; shared - /var
Source: "var\log\lastlog"; DestDir: "{app}\var\log"; Components: server; Flags: onlyifdoesntexist uninsneveruninstall
Source: "var\run\utmp";    DestDir: "{app}\var\run"; Components: server; Flags: onlyifdoesntexist uninsneveruninstall

[Dirs]
Name: "{app}\tmp";       Components: client server
Name: "{app}\var\empty"; Components: server

[Icons]
Name: "{group}\Documentation"; Filename: "{app}\Cygwin-OpenSSH.chm"; Comment: "Cygwin OpenSSH documentation"

[Tasks]
Name: startservice; Description: "Start service"; Components: server
Name: modifypath;   Description: "Add to system path"; Components: client server
Name: s4ulogonfix;  Description: "{#S4ULogonFixTaskCaption}"; Components: server; Flags: unchecked; OnlyBelowVersion: 6.3

[Run]
; Add Users:RWXD for /tmp
Filename: "{app}\bin\setacl.exe"; Parameters: "-on ""{app}\tmp"" -ot file -actn ace -ace n:S-1-5-32-545;p:change"; StatusMsg: "Configuring permissions..."; Components: client server; Flags: runhidden
; Set SYSTEM:F/Administrators:F for /etc/rsyncd.secrets
Filename: "{app}\bin\setacl.exe"; Parameters: "-on ""{app}\etc\rsyncd.secrets"" -ot file -actn ace -ace n:S-1-5-18;p:full -actn ace -ace n:S-1-5-32-544;p:full -actn setprot -op dacl:p_nc"; StatusMsg: "Configuring permissions..."; Components: client server; Flags: runhidden
; Set SYSTEM:F/Administrators:F for /users
Filename: "{app}\bin\setacl.exe"; Parameters: "-on ""{app}\users"" -ot file -actn ace -ace n:S-1-5-18;p:full -actn ace -ace n:S-1-5-32-544;p:full -actn setprot -op dacl:p_nc"; StatusMsg: "Configuring permissions..."; Components: server; Flags: runhidden
; Configure fstab
Filename: "{app}\bin\ps1exec.exe"; Parameters: "-n -q -s 0 -w ""{app}\bin\Set-FstabConfig.ps1"""; StatusMsg: "Configuring fstab file..."; Components: client server
; Create SSH host keys
Filename: "{app}\bin\ps1exec.exe"; Parameters: "-n -q -s 0 -w ""{app}\bin\Set-SSHHostKey.ps1"""; StatusMsg: "Configuring SSH host keys..."; Components: server
; Configure local access group and sshd_config file
Filename: "{app}\bin\ps1exec.exe"; Parameters: "-n -q -s 0 -w ""{app}\bin\Set-SSHGroup.ps1"" -- -NoConfirm"; StatusMsg: "Configuring local access group and sshd_config file..."; Components: server
; S4U local account logon fix - OS older than 6.3 (Windows 8.1/Server 2012 R2)
Filename: "{app}\bin\ps1exec.exe"; Parameters: "-n -q -s 0 -w ""{app}\bin\Set-S4ULogonFix.ps1"" -- -Enable -NoConfirm"; StatusMsg: "Configuring MsV1_0S4ULogon fix..."; Components: server; Tasks: s4ulogonfix
; Install service
Filename: "{app}\bin\ps1exec.exe"; Parameters: "-n -q -s 0 -w ""{app}\bin\Set-SSHService.ps1"" -- -Install -NoConfirm"; StatusMsg: "Installing OpenSSH server service..."; Components: server
; Start service
Filename: "{app}\bin\ps1exec.exe"; Parameters: "-n -q -s 0 -w ""{app}\bin\Set-SSHService.ps1"" -- -Start -NoConfirm";   StatusMsg: "Starting OpenSSH server service..."; Components: server; Tasks: startservice

[UninstallRun]
Filename: "{app}\bin\ps1exec.exe"; Parameters: "-n -q -s 0 -w ""{app}\bin\Set-SSHService.ps1"" -- -Uninstall -NoConfirm"; RunOnceId: "uninstallservice"; Components: server

[Code]

// Code support:
// * Verify PowerShell v2 or later installed before allowing install
// * Add to Path or remove from Path
// * Automatically uninstall existing before installing current
// * Enable S4ULogonFix by default when OS < v6.3, not domain member, and
//   interactive install

Var
  S4UTaskDefaultChanged: Boolean;
  ShowCancelConfirmationPrompt: Boolean;

// Windows API functions for testing domain membership
Function NetGetJoinInformation(lpServer: String; Var lpNameBuffer: DWORD; Var BufferType: DWORD): DWORD; External 'NetGetJoinInformation@netapi32.dll stdcall setuponly';
Function NetApiBufferFree(Buffer: DWORD): DWORD; External 'NetApiBufferFree@netapi32.dll stdcall setuponly';

// Return True if computer is a domain member, or False otherwise
Function IsDomainMember(): Boolean;
  Var
    NameBuffer, BufferType: DWORD;
  Begin
  Result := False;
  If NetGetJoinInformation('', NameBuffer, BufferType) = 0 Then
    Begin
    Result := BufferType = 3;  // NetSetupDomainName - domain member
    NetApiBufferFree(NameBuffer);
    End;
  End;

// Initialize globals
Procedure InitializeWizard();
  Begin
  S4UTaskDefaultChanged := False;
  ShowCancelConfirmationPrompt := True;
  End;

// Return True if we detect at least PowerShell v2, or False otherwise
Function IsPowerShell2OrHigherInstalled(): Boolean;
  Var
    RootPath, VersionString: String;
    SubkeyNames: TArrayOfString;
    HighestPSVersion, I, PSVersion: Integer;
  Begin
  RootPath := 'SOFTWARE\Microsoft\PowerShell';
  Result := RegGetSubkeyNames(HKEY_LOCAL_MACHINE, RootPath, SubkeyNames);
  If Not Result Then Exit;
  HighestPSVersion := 0;
  For I := 0 To GetArrayLength(SubkeyNames) - 1 Do
    Begin
    If RegQueryStringValue(HKEY_LOCAL_MACHINE, RootPath + '\' + SubkeyNames[I] + '\PowerShellEngine', 'PowerShellVersion', VersionString) Then
      Begin
      PSVersion := StrToIntDef(Copy(VersionString, 0, 1), 0);
      If PSVersion > HighestPSVersion Then
        HighestPSVersion := PSVersion;
      End;
    End;
  Result := HighestPSVersion >= 2;
  End;

// Enforce setup condition: PowerShell 2.0 or later is required
Function InitializeSetup(): Boolean;
  Begin
  Result := IsPowerShell2OrHigherInstalled();
  If Not Result Then
    Begin
    Log('FATAL: Setup cannot continue because Windows PowerShell version 2.0 or later is required.');
    If Not WizardSilent() Then
      MsgBox('Setup cannot continue because Windows PowerShell version 2.0 or later is required.'
        + #13#10#13#10 + 'Setup will now exit.', mbCriticalError, MB_OK);
    End;
  End;

// Called when a) the user clicks the Cancel button or clicks the window's
// Close button or b) WizardForm.Close() method is called
Procedure CancelButtonClick(CurPageID: Integer; Var Cancel, Confirm: Boolean);
  Begin
  Confirm := ShowCancelConfirmationPrompt;
  End;

// Existing version is not installed, or uninstall succeeded
Function NotInstalledOrUninstall(): Integer;
  Var
    AppId, RegPath, UninstallString: String;
  Begin
  Result := 0;
  AppId := '{#emit SetupSetting("AppId")}';
  RegPath := ExpandConstant('SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\' + AppId + '_is1');
  If Not RegQueryStringValue(HKEY_LOCAL_MACHINE, RegPath, 'QuietUninstallString', UninstallString) Then
    Begin
    Log('INFO: No previously installed version detected.');
    Exit;
    End;
  // '>' means "second parameter contains entire command line"
  Exec('>', UninstallString + ' /SUPPRESSMSGBOXES', '', SW_SHOW, ewWaitUntilTerminated, Result);
  If Result = 0 Then
    Log('INFO: Uninstall of previously installed version succeeded.')
  Else
    Log('FATAL: Uninstall of previously installed version failed. Error ' + IntToStr(Result) + ': ' + SysErrorMessage(Result) + '.');
  End;

// Can't install if previously installed and uninstall failed
Function NextButtonClick(CurPageID: Integer): Boolean;
  Var
    ResultCode: Integer;
  Begin
  Result := True;
  If CurPageID = wpReady Then
    Begin
    ResultCode := NotInstalledOrUninstall();
    Result := ResultCode = 0;
    If Not Result Then
      Begin
      If Not WizardSilent() Then
        MsgBox('Setup cannot complete because the previously installed version did not uninstall successfully.'
          + #13#10#13#10 + 'Error ' + IntToStr(ResultCode) + ': ' + SysErrorMessage(ResultCode) + '.'
          + #13#10#13#10 + 'Setup will now exit.', mbCriticalError, MB_OK);
      // Do not display cancel confirmation prompt
      ShowCancelConfirmationPrompt := False;
      // Exit setup
      WizardForm.Close();
      End;
    End;
  End;

// Selects a task based on its caption
Procedure SelectTaskByDescription(Caption: String; Check: Boolean);
  Var
    I: Integer;
  Begin
  For I := 0 to WizardForm.TasksList.Items.Count - 1 Do
    Begin
    If Caption = WizardForm.TasksList.ItemCaption[I] Then
      WizardForm.TasksList.Checked[I] := Check;
    End;
  End;

// Called after a new wizard page (specified by CurPageID) is shown
Procedure CurPageChanged(PageID: Integer);
  Begin
  If PageID = wpSelectTasks Then
    Begin
    If Not WizardSilent() Then
      Begin
      // Only select if not already changed
      If Not S4UTaskDefaultChanged Then
        Begin
        // Interactive install: Set s4ulogonfix task default:
        // If not domain member, select by default (but only interactively)
        // If silent install, command line must specify the task
        SelectTaskByDescription('{#emit S4ULogonFixTaskCaption}', Not IsDomainMember());
        S4UTaskDefaultChanged := True;
        End;
      End;
    End;
  End;


// Acknowledgment: Jared Breland (jbreland@legroom.net)

// Set up path(s) to add/remove here
Function ModPathDir(): TArrayOfString;
  Begin
  SetArrayLength(Result, 1);
  Result[0] := ExpandConstant('{app}\bin');
  End;

Procedure ModPath();
  Var
    RegPath:       String;
    ModPathDirArr: TArrayOfString;
    OldPath:       String;
    NewPath:       String;
    UpdatePath:    Boolean;
    PathArr:       TArrayOfString;
    D, I:          Integer;
  Begin
  RegPath := 'SYSTEM\CurrentControlSet\Control\Session Manager\Environment';
  // Get array of new directories and act on each individually
  ModPathDirArr := ModPathDir();
  For D := 0 To GetArrayLength(ModPathDirArr) - 1 Do
    Begin
    UpdatePath := True;
    // Get current path, split into an array
    RegQueryStringValue(HKEY_LOCAL_MACHINE, RegPath, 'Path', OldPath);
    If OldPath[Length(OldPath) - 1] <> ';' Then
      OldPath := OldPath + ';';
    I := 0;
    While Pos(';', OldPath) > 0 Do
      Begin
      SetArrayLength(PathArr, I + 1);
      PathArr[I] := Copy(OldPath, 0, Pos(';', OldPath) - 1);
      OldPath := Copy(OldPath, Pos(';', OldPath) + 1, Length(OldPath));
      I := I + 1;
      // Check if current directory matches app dir
      If ModPathDirArr[D] = PathArr[I - 1] Then
        Begin
        If IsUninstaller() Then
          Begin
          // if uninstalling, remove dir from path
          Continue;
          End
        Else
          Begin
          // if installing, flag that dir already exists in path
          UpdatePath := False;
          End;
        End;
      // Add current directory to new path
      If I = 1 Then
        Begin
        NewPath := PathArr[I - 1];
        End
      Else
        Begin
        NewPath := NewPath + ';' + PathArr[I - 1];
        End;
      End;
    // Append app dir to path if not already included
    If (Not IsUninstaller()) And UpdatePath Then
      NewPath := NewPath + ';' + ModPathDirArr[D];
    // Write new path
    RegWriteStringValue(HKEY_LOCAL_MACHINE, RegPath, 'Path', NewPath);
    End;
  End;

Procedure CurStepChanged(CurStep: TSetupStep);
  Begin
  If CurStep = ssPostInstall Then
    If IsTaskSelected('modifypath') Then
      ModPath();
  End;

// Split a string into an array using passed delimeter
Procedure SplitString(Var Dest: TArrayOfString; Text: String; Separator: String);
  Var
    I: Integer;
  Begin
  I := 0;
  Repeat
    SetArrayLength(Dest, I + 1);
    If Pos(Separator,Text) > 0 Then
      Begin
      Dest[I] := Copy(Text, 1, Pos(Separator, Text) - 1);
      Text := Copy(Text, Pos(Separator, Text) + Length(Separator), Length(Text));
      I := I + 1;
      End
    Else
      Begin
      Dest[I] := Text;
      Text := '';
      End;
  Until Length(Text) = 0;
  End;

Procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
  Var
    AppId:     String;
    RegPath:   String;
    RegString: String;
    TaskArr:   TArrayOfString;
    I:         Integer;
  Begin
  // only run during actual uninstall
  If CurUninstallStep = usUninstall Then
    Begin
    AppId := '{#emit SetupSetting("AppId")}';
    RegPath := ExpandConstant('SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\' + AppId + '_is1');
    RegQueryStringValue(HKEY_LOCAL_MACHINE, RegPath, 'Inno Setup: Selected Tasks', RegString);
    If RegString <> '' Then
      Begin
      SplitString(TaskArr, RegString, ',');
      If GetArrayLength(TaskArr) > 0 Then
        Begin
        For I := 0 To GetArrayLength(TaskArr) - 1 Do
          Begin
          If CompareText(TaskArr[I], 'modifypath') = 0 Then
            ModPath();
          End;
        End;
      End;
    End;
  End;
