$ErrorActionPreference = 'Stop'

$packageName = 'quickdeploy'
$toolsDir   = Split-Path -Parent $MyInvocation.MyCommand.Definition

$version    = '0.4.0'
# $osArch     = if ([Environment]::Is64BitOperatingSystem) { 'amd64' } else { 'x86' }
$osArch     = 'amd64'

$binaryUrl  = "https://quickdeploy.dev/api/download/windows-$osArch"
$exePath    = Join-Path $toolsDir 'quickdeploy.exe'

Get-ChocolateyWebFile `
    -PackageName $packageName `
    -FileFullPath $exePath `
    -Url $binaryUrl `
    -ChecksumType 'sha256' `
    -Checksum 'sha256:f6be06ce6be4968ad2de07432439f4bc2b8ef93142100374bb1efc2796e3be8e'
