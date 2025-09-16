$ErrorActionPreference = 'Stop'

$packageName = 'quickdeploy'
$toolsDir   = Split-Path -Parent $MyInvocation.MyCommand.Definition

$version    = '0.3.2'
# $osArch     = if ([Environment]::Is64BitOperatingSystem) { 'amd64' } else { 'x86' }
$osArch     = '0.3.2'

$binaryUrl  = "https://quickdeploy.dev/api/download/windows-$osArch"
$exePath    = Join-Path $toolsDir 'quickdeploy.exe'

Get-ChocolateyWebFile `
    -PackageName $packageName `
    -FileFullPath $exePath `
    -Url $binaryUrl `
    -ChecksumType 'sha256' `
    -Checksum 'sha256:bd8451be7456e584735d44d2951784e8d194e8984813b42bd9e65028d36fa699'
