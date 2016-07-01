$ErrorActionPreference = 'Stop'

$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
	packageName   = 'ivy'
	unzipLocation = $toolsDir
	url           = 'http://www.webhostingjams.com/mirror/apache//ant/ivy/2.4.0/apache-ivy-2.4.0-bin.zip'
	softwareName  = 'ivy*'
	checksum      = '86b581c7be6358e7e98ec76968d9aac8'
	checksumType  = 'md5'
}

if(!(Test-Path $env:ANT_HOME)) {
	$ex = New-Object System.Exception "This package requires that the ANT_HOME environment variable is set to the ant home directory. Please set the environment variable, reload your console, and try installing this package again."
	throw $ex
}

Install-ChocolateyZipPackage @packageArgs
Copy-Item ($toolsDir + "\apache-ivy-2.4.0\ivy-2.4.0.jar") ($env:ANT_HOME + "\lib\ivy-2.4.0.jar")