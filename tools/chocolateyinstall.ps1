$ErrorActionPreference = 'Stop'

$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
	packageName   = 'ivy'
	unzipLocation = $toolsDir
	url           = 'https://dlcdn.apache.org/ant/ivy/2.5.2/apache-ivy-2.5.2-bin.zip'
	softwareName  = 'ivy*'
	checksum      = '07a16447218d57dae121f7377b72663ffab6e5477e7b8c5201b79a3d02c7f667cf6035489a51b64ab5200c64ea1a948f6b28b5589df24644a6511d99b565ca2a'
	checksumType  = 'sha512'
}

if(!(Test-Path $env:ANT_HOME)) {
	$ex = New-Object System.Exception "This package requires that the ANT_HOME environment variable is set to the ant home directory. Please set the environment variable, reload your console, and try installing this package again."
	throw $ex
}

Install-ChocolateyZipPackage @packageArgs
Copy-Item ($toolsDir + "\apache-ivy-2.5.2\ivy-2.5.2.jar") ($env:ANT_HOME + "\lib\ivy-2.5.2.jar")