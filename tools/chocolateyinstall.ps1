$ErrorActionPreference = 'Stop'

$packageName= 'ivy'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://www.webhostingjams.com/mirror/apache//ant/ivy/2.4.0/apache-ivy-2.4.0-bin.zip'
$url64      = 'http://www.webhostingjams.com/mirror/apache//ant/ivy/2.4.0/apache-ivy-2.4.0-bin.zip'

$packageArgs = @{
	packageName   = $packageName
	unzipLocation = $toolsDir
	url           = $url
	url64bit      = $url64
	softwareName  = 'ivy*'
	checksum      = '86b581c7be6358e7e98ec76968d9aac8'
	checksumType  = 'md5'
	checksum64    = '86b581c7be6358e7e98ec76968d9aac8'
	checksumType64= 'md5'
}

Install-ChocolateyZipPackage @packageArgs
Copy-Item ($toolsDir + "\apache-ivy-2.4.0\ivy-2.4.0.jar") ($env:ANT_HOME + "\lib\ivy-2.4.0.jar")