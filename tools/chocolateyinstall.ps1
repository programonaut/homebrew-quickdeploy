$ErrorActionPreference = 'Stop'

$packageName = 'quickdeploy'
$toolsDir   = Split-Path -Parent $MyInvocation.MyCommand.Definition

$version    = '0.3.0'
# $osArch     = if ([Environment]::Is64BitOperatingSystem) { 'amd64' } else { 'x86' }
$osArch     = 'amd64'

$binaryUrl  = "https://quickdeploy.dev/api/download/windows-$osArch"
$exePath    = Join-Path $toolsDir 'quickdeploy.exe'

Get-ChocolateyWebFile `
    -PackageName $packageName `
    -FileFullPath $exePath `
    -Url $binaryUrl `
    -ChecksumType 'sha256' `
    -Checksum 'sha256:86cb4cd749cfacc6fb53eda01e07a09696361c9ce530408a462e995299ec16cc'
