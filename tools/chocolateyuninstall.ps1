$ErrorActionPreference = 'Stop'

$packageName = 'ivy'

Uninstall-ChocolateyZipPackage $packageName apache-ivy-2.5.0-bin.zip
Remove-Item ($env:ANT_HOME + "\lib\ivy-2.5.0.jar")
