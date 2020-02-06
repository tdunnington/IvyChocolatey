$ErrorActionPreference = 'Stop'

$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
	packageName   = 'ivy'
	unzipLocation = $toolsDir
	url           = 'http://mirror.cc.columbia.edu/pub/software/apache//ant/ivy/2.5.0/apache-ivy-2.5.0-bin.zip'
	softwareName  = 'ivy*'
	checksum      = '6502619f1d3a399bc930adb788ab140e'
	checksumType  = 'md5'
}

if(!(Test-Path $env:ANT_HOME)) {
	$ex = New-Object System.Exception "This package requires that the ANT_HOME environment variable is set to the ant home directory. Please set the environment variable, reload your console, and try installing this package again."
	throw $ex
}

Install-ChocolateyZipPackage @packageArgs
Copy-Item ($toolsDir + "\apache-ivy-2.5.0\ivy-2.5.0.jar") ($env:ANT_HOME + "\lib\ivy-2.5.0.jar")
