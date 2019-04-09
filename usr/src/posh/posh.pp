// posh.pp
// Written by Bill Stewart (bstewart@iname.com)
//
// Short/simple Win32 executable to run "winpty powershell".
//
// Wrote this to be able to specify /bin/posh as a shell in Cygwin.
//
// Notes:
// * This executable must sit in the same directory as winpty (Cygwin /bin)
// * Finds PowerShell by reading the registry
// * If winpty or powershell not found, return with exit code 2 
//   (ERROR_FILE_NOT_FOUND); otherwise, return with whatever exit code
//   winpty returns with

{$APPTYPE CONSOLE}
{$MODE OBJFPC}
{$H+}

{$IFDEF WIN64}
  {$R posh_x64.res}
{$ELSE}
  {$R posh.res}
{$ENDIF}

Uses
  Dos, Windows;

Const
  HKEY_LOCAL_MACHINE = $80000002;
  INSTALLATION_SUBKEY: PChar = 'SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell';

Var
  WinptyPath, PSPath: String;
  N: LongInt;
  CommandLine: String;
  StartInfo: STARTUPINFO;
  ProcInfo: PROCESS_INFORMATION;
  OK: Boolean;

// Returns the path of the currently running executable
Function ExecutableDir: String;
  Var
    Buf: Array[0..MAX_PATH + SizeOf(Char)] Of Char;
    FDir: DirStr;
    FName: NameStr;
    FExt: ExtStr;
  Begin
  Result := '';
  If GetModuleFileName(0, @Buf, SizeOf(Buf)) > 0 Then
    Begin
    FSplit(String(Buf), FDir, FName, FExt);
    Result := FDir;
    End;
  End;

// Concatenates Part1 + Part2, inserting '\' between if needed
Function BuildPath(Part1, Part2: String): String;
  Begin
  If Part1[Length(Part1)] <> '\' Then
    Part1 := Part1 + '\';
  Result := Part1 + Part2;
  End;

// Returns True if the file exists, or false otherwise
Function ExistFile(Const Filename: String): Boolean;
  Var
    Attrs: DWORD;
  Begin
  Result := False;
  Attrs := GetFileAttributes(PChar(Filename));
  If Attrs <> $FFFFFFFF Then
    Result := Attrs And FILE_ATTRIBUTE_DIRECTORY = 0;
  End;

// Reads data from a registry value: Specify the hive, subkey, and value name;
// the function retrieves the value type, a pointer to the data buffer, and the
// buffer's size into Var parameters and returns the API return code
Function ReadValue(hKey: DWORD;
                   pSubKey, pValueName: PChar;
                   Var ValueType: DWORD;
                   Var pData: Pointer;
                   Var cbData: DWORD): LongInt;
  Var
    hkHandle: HANDLE;
  Begin
  Result := RegOpenKeyEx(hKey, pSubKey, 0, KEY_READ, hkHandle);
  If Result = 0 Then
    Begin
    // First call with lpData = NULL: retrieve required size into lpcbData
    Result := RegQueryValueEx(hkHandle, pValueName, Nil, @ValueType, Nil, @cbData);
    If Result = 0 Then
      Begin
      // Now, allocate the buffer and retrieve the data into it
      GetMem(pData, cbData);
      Result := RegQueryValueEx(hkHandle, pValueName, Nil, @ValueType, pData, @cbData);
      If Result <> 0 Then
        Begin
        ValueType := 0;
        If (pData <> Nil) And (cbData > 0) Then
          FreeMem(pData, cbData);
        pData := Nil;
        cbData := 0;
        End;
      End;
    RegCloseKey(hkHandle);
    End;
  End;

// Returns the path and filename of powershell.exe; returns an empty string on
// failure
Function GetPSPath: String;
  Var
    RC: DWORD;
    ValueType: DWORD;
    pData: PChar;
    cbData: DWORD;
  Begin
  Result := '';
  RC := ReadValue(HKEY_LOCAL_MACHINE, INSTALLATION_SUBKEY, 'Path', ValueType, pData, cbData);
  If (RC = 0) And (pData <> Nil) And (cbData > 0) Then
    Begin
    Result := pData;
    FreeMem(pData, cbData);
    End;
  End;

// Quotes a string if it contains spaces
Function Quote(S: String): String;
  Begin
  If Pos(' ', S) > 0 Then
    Result := '"' + S + '"'
  Else
    Result := S;
  End;

Begin
  PSPath := GetPSPath;
  If Not ExistFile(PSPath) Then
    Begin
    WriteLn('File not found - ', PSPath);
    ExitCode := ERROR_FILE_NOT_FOUND;
    Exit;
    End;

  WinptyPath := BuildPath(ExecutableDir, 'winpty.exe');
  If Not ExistFile(WinptyPath) Then
    Begin
    WriteLn('File not found - ', WinptyPath);
    ExitCode := ERROR_FILE_NOT_FOUND;
    Exit;
    End;

  CommandLine := Quote(WinptyPath) + ' ' + Quote(PSPath);

  // Append any command line arguments
  For N := 1 To ParamCount Do
    Begin
    CommandLine := CommandLine + ' ' + Quote(ParamStr(N));
    End;

  //For debugging
  //WriteLn('[', CommandLine, ']');
  //Exit;

  // Initialize STARTUPINFO structure
  With StartInfo Do
    Begin
    FillChar(StartInfo, SizeOf(StartInfo), 0);
    cb := SizeOf(STARTUPINFO);
    End;

  // Execute CreateProcess
  OK := CreateProcess(Nil,     // lpApplicationName
          PChar(CommandLine),  // lpCommandLine
          Nil,                 // lpProcessAttributes
          Nil,                 // lpThreadAttributes
          True,                // bInheritHandles
          0,                   // dwCreationFlags
          Nil,                 // lpEnvironment
          Nil,                 // lpCurrentDirectory
          @StartInfo,          // lpStartupInfo
          @ProcInfo);          // lpProcessInformation
  ExitCode := GetLastError;

  If OK Then
    If WaitForSingleObject(ProcInfo.hProcess, INFINITE) <> WAIT_FAILED Then
      GetExitCodeProcess(ProcInfo.hProcess, @ExitCode);

End.
