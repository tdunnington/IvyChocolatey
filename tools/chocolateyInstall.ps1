$ErrorActionPreference = 'Stop'

$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
	packageName   = 'ivy'
	unzipLocation = $toolsDir
	url           = 'https://dlcdn.apache.org/ant/ivy/2.5.3/apache-ivy-2.5.3-bin.zip'
	softwareName  = 'ivy*'
	checksum      = '9564547690561c8b69c133cb188e002c0a94cc696905c1c0386afa44de13c217afb6824c04591294cd0890fc46fc620a53cd567f9056c7285d515c0b5477db6c'
	checksumType  = 'sha512'
}

if(!(Test-Path $env:ANT_HOME)) {
	$ex = New-Object System.Exception "This package requires that the ANT_HOME environment variable is set to the ant home directory. Please set the environment variable, reload your console, and try installing this package again."
	throw $ex
}

Install-ChocolateyZipPackage @packageArgs
Copy-Item ($toolsDir + "\apache-ivy-2.5.3\ivy-2.5.3.jar") ($env:ANT_HOME + "\lib\ivy-2.5.3.jar")
