$ErrorActionPreference = 'Stop'

$packageName = 'ivy'
$softwareName = 'ivy*'

Uninstall-ChocolateyZipPackage $packageName
Remove-Item ($env:ANT_HOME + \lib\ivy-2.4.0.jar")