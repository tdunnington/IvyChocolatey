$ErrorActionPreference = 'Stop'

$packageName = 'ivy'

Uninstall-ChocolateyZipPackage $packageName apache-ivy-2.5.1-bin.zip
Remove-Item ($env:ANT_HOME + "\lib\ivy-2.5.1.jar")