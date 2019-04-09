# Set-SSHHostKey.ps1
# Written by Bill Stewart (bstewart@iname.com)

# Same as ssh-keygen -A, except it works on file systems mounted using the
# 'noacl' option in /etc/fstab.
#
# Configures the file permissions on the host key files such that only SYSTEM
# and and Administrators have full control (no other access).

#requires -version 2

<#
.SYNOPSIS
Creates SSH host key files using ssh-keygen and sets restricted permissions on the private key files.

.DESCRIPTION
Creates SSH host key files using ssh-keygen and sets restricted permissions on the private key files.

.PARAMETER NoConfirm
Automatically answers "yes" to all confirmation prompts.

.PARAMETER Force
Forces overwriting the ssh host key files if they exist.
#>

[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High")]
param(
  [Switch] $NoConfirm,

  [Switch] $Force
)

if ( -not $PSScriptRoot ) {
  $PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent
}

$CYGPATH = Join-Path $PSScriptRoot "cygpath"
Get-Command $CYGPATH -ErrorAction Stop | Out-Null
$SSH_KEYGEN = Join-Path $PSScriptRoot "ssh-keygen"
Get-Command $SSH_KEYGEN -ErrorAction Stop | Out-Null
$SETACL = Join-Path $PSScriptRoot "setacl"
Get-Command $SETACL -ErrorAction Stop | Out-Null

if ( (-not (& $CYGPATH -aw /)) ) {
  throw "cygpath command returned no output. Suspect missing Cygwin DLL(s)."
}

# Added this parameter because passing "-Confirm:0" on the powershell.exe -File
# command line throws an error (this is arguably a bug, but easily worked
# around)
if ( $NoConfirm ) {
  $ConfirmPreference = "None"
}

"dsa","ecdsa","ed25519","rsa" | ForEach-Object {
  $generate = $true
  $outputPath = "/etc/ssh_host_{0}_key" -f $_
  $windowsPath = & $CYGPATH -aw $outputPath
  $pathExists = Test-Path $windowsPath
  if ( $pathExists ) {
    if ( $Force ) {
      $generate = $PSCmdlet.ShouldProcess($windowsPath, "Overwrite file")
    }
    else {
      $generate = $false
      Write-Warning "'$windowsPath' already exists and -Force parameter not specified -- not overwritten."
    }
  }
  if ( $generate ) {
    if ( $pathExists ) {
      Remove-Item $windowsPath -ErrorAction Stop
    }
    & $SSH_KEYGEN -q -t $_ -f $outputPath -N '""'
    if ( $LASTEXITCODE -eq 0 ) {
      & $SETACL -on $windowsPath -ot file -actn ace -ace "n:S-1-5-18;p:full" -actn ace -ace "n:S-1-5-32-544;p:full" -actn setprot -op "dacl:p_nc" > $null
      if ( $LASTEXITCODE -eq 0 ) {
        Write-Host ("ssh-keygen: generated host key: {0}" -f $_.ToUpper())
      }
      else {
        Remove-Item $windowsPath,("{0}.pub" -f $windowsPath) -ErrorAction SilentlyContinue
      }
    }
  }
}
