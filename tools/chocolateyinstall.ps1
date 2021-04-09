$ErrorActionPreference = 'Stop'

$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
	packageName   = 'ivy'
	unzipLocation = $toolsDir
	url           = 'https://mirror.olnevhost.net/pub/apache//ant/ivy/2.5.0/apache-ivy-2.5.0-bin.zip'
	softwareName  = 'ivy*'
	checksum      = '8a0bffab2c9225c2e761adf36e4f17eea2cd1876b5a6295d929569943bbcc47519a005c78328584852528d8ac71f1b47f7098490307e5d487b3676aad6d4eacd'
	checksumType  = 'sha512'
}

if(!(Test-Path $env:ANT_HOME)) {
	$ex = New-Object System.Exception "This package requires that the ANT_HOME environment variable is set to the ant home directory. Please set the environment variable, reload your console, and try installing this package again."
	throw $ex
}

Install-ChocolateyZipPackage @packageArgs
Copy-Item ($toolsDir + "\apache-ivy-2.5.0\ivy-2.5.0.jar") ($env:ANT_HOME + "\lib\ivy-2.5.0.jar")