$ErrorActionPreference = 'Stop'

$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
	packageName   = 'ivy'
	unzipLocation = $toolsDir
	url           = 'https://dlcdn.apache.org/ant/ivy/2.5.1/apache-ivy-2.5.1-bin.zip'
	softwareName  = 'ivy*'
	checksum      = '0ad2e4ba299c9831b7de451a6318913e1a54b7682e15e445cec2d35d5b1693eff526aa7afc12f3a730b86ea86baf93e2e4645c904119c28d7448ed67e16182ac'
	checksumType  = 'sha512'
}

if(!(Test-Path $env:ANT_HOME)) {
	$ex = New-Object System.Exception "This package requires that the ANT_HOME environment variable is set to the ant home directory. Please set the environment variable, reload your console, and try installing this package again."
	throw $ex
}

Install-ChocolateyZipPackage @packageArgs
Copy-Item ($toolsDir + "\apache-ivy-2.5.1\ivy-2.5.1.jar") ($env:ANT_HOME + "\lib\ivy-2.5.1.jar")