$ErrorActionPreference = 'Stop'

$packageName = 'quickdeploy'
$toolsDir   = Split-Path -Parent $MyInvocation.MyCommand.Definition

$version    = '0.3.11'
# $osArch     = if ([Environment]::Is64BitOperatingSystem) { 'amd64' } else { 'x86' }
$osArch     = 'amd64'

$binaryUrl  = "https://quickdeploy.dev/api/download/windows-$osArch"
$exePath    = Join-Path $toolsDir 'quickdeploy.exe'

Get-ChocolateyWebFile `
    -PackageName $packageName `
    -FileFullPath $exePath `
    -Url $binaryUrl `
    -ChecksumType 'sha256' `
    -Checksum 'sha256:bb98a5f6a9e9e5062ff80baa6d67c2aca5bdde3d85ee08dfbac4a9dfaf30aa03'
