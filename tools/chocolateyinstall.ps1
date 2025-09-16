$ErrorActionPreference = 'Stop'

$packageName = 'quickdeploy'
$toolsDir   = Split-Path -Parent $MyInvocation.MyCommand.Definition

$version    = '0.3.1'
# $osArch     = if ([Environment]::Is64BitOperatingSystem) { 'amd64' } else { 'x86' }
$osArch     = '0.3.1'

$binaryUrl  = "https://quickdeploy.dev/api/download/windows-$osArch"
$exePath    = Join-Path $toolsDir 'quickdeploy.exe'

Get-ChocolateyWebFile `
    -PackageName $packageName `
    -FileFullPath $exePath `
    -Url $binaryUrl `
    -ChecksumType 'sha256' `
    -Checksum 'sha256:e665f6597a30fe8c5a6f6d1b6c64ccca0482c84a25e39d55286577271cf4ce46'
