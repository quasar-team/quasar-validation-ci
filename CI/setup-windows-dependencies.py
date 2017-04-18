import platform
import os
import shutil
import urllib
import subprocess
import sys

#
# Script globals
#
downloadsDir = os.path.join(os.getcwd(), 'downloads')
oldDownloadsDir = os.path.join(os.getcwd(), 'downloads.OLD')
xsdInstallDir = os.path.abspath(os.path.join(os.sep, 'Program Files (x86)', 'CodeSynthesis XSD 3.3'))
xsdInstallBinaryDir = os.path.join(xsdInstallDir, 'bin')

downloaded_files = {
'LXML': os.path.join(downloadsDir, 'lxml-3.4.4-cp27-none-win32.whl'),
'LXML_URL': 'https://pypi.python.org/packages/5c/5e/c2d36ed1f234649a9724ceaf8a5ac549cbd51b93a0b524448da46408166d/lxml-3.4.4-cp27-none-win32.whl#md5=21216e68cdbaa82dea9b6907bdc39bed',
'PYSVN': os.path.join(downloadsDir, 'py27-pysvn-svn193-1.9.0-1849-Win32.exe'),
'PYSVN_URL': 'https://cernbox.cern.ch/index.php/s/CFxkAy38E8C8ipA/download',
'ASTYLE': os.path.join(downloadsDir, 'astyle.zip'),
'ASTYLE_URL': 'https://cernbox.cern.ch/index.php/s/ajLDK1WhB1fi5Io/download',
'BOOST': os.path.join(downloadsDir, 'boost_1_59_0_VS2013.zip'),
'BOOST_URL': 'https://cernbox.cern.ch/index.php/s/n6XWtzH8mwH2jhq/download',
'LIBXML2': os.path.join(downloadsDir, 'libxml2-2.7.8.win32.zip'),
'LIBXML2_URL': 'https://cernbox.cern.ch/index.php/s/lJgrBI6azmEjy8b/download',
'XSD': os.path.join(downloadsDir,'xsd-3.3.msi'),
'XSD_URL': 'http://www.codesynthesis.com/download/xsd/3.3/windows/i686/xsd-3.3.msi',
'XERCES': os.path.join(downloadsDir, 'xerces-c-3.1.2.zip'),
'XERCES_URL': 'https://cernbox.cern.ch/index.php/s/OotvPYLOjt9KaR2/download',
'OPENSSL': os.path.join(downloadsDir, 'Win64OpenSSL-1_1_0e.exe'),
'OPENSSL_URL': 'https://slproweb.com/download/Win64OpenSSL-1_1_0e.exe'
}

windows_tools = {
'UNZIP':'"C:/Program Files/7-Zip/7z.exe"', 'UNZIP_ARGS': 'x {0} -o{1}' , 
'MSI': 'msiexec' , 'MSI_ARGS': '/i {0} /quiet /qn /norestart /log install.log' ,
'EXE_INSTALLER': '{0}', 'EXE_INSTALLER_ARGS': '/install=agent /SP- /SILENT /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /NOCLOSEAPPLICATIONS /NOCANCEL'
}


#
# Functions
#
def setup_downloads_directories():
	try:
		# downloads.OLD -> delete
		if os.path.exists(oldDownloadsDir):
			print "deleting dir ["+oldDownloadsDir+"]"
			shutil.rmtree(oldDownloadsDir, ignore_errors=True)
		
		# downloads -> downloads.OLD
		if os.path.exists(downloadsDir):
			print "moving dir ["+downloadsDir+"] to ["+oldDownloadsDir+"]"
			shutil.move(downloadsDir, oldDownloadsDir)
		
		# downloads (clean)
		print "creating clean dir ["+downloadsDir+"] to ["+oldDownloadsDir+"]"
		os.mkdir(downloadsDir)
	except Exception as e:
		sys.exit('unexpected error whilst dealing with downloads directories [{0}] and  [${1}], error msg: {2}'.format(downloadsDir, oldDownloadsDir, e.message))

def download_file(filenameOnDisk, remoteURL):
	print 'downloading file [{0}] from [{1}]'.format(filenameOnDisk, remoteURL)
	try:
		urllib.urlretrieve (remoteURL, filenameOnDisk)
		print "downloaded file [{0}] size [{1} bytes]".format(filenameOnDisk, os.path.getsize(filenameOnDisk))
	except Exception as e:
		sys.exit('unexpected downloading file [{0}] from [${1}], error msg: {2}'.format(filenameOnDisk, remoteURL, e.message))

def run_command(cmd_purpose_string, cmd, args):
	print 'executing cmd for purpose [{0}], cmd [{1}], args [{2}]'.format(cmd_purpose_string, cmd, args)

	try:
		subprocess.check_call(cmd+" "+args, shell=True)
	except subprocess.CalledProcessError as e:
		sys.exit('cmd exec for [{0}] failed, cmd [{1}], return code [{2}]'.format(cmd_purpose_string, e.cmd, e.returncode) )
	except Exception as e:
		sys.exit('cmd exec for [{1}] failed, unknown error. Exception message: {2}'.format(cmd_purpose_string, e.message) )

def write_file(filename, content):
	with open('setLocalPath.bat', 'w') as f:
		f.truncate()
		f.write(content)

def rename_codesynthesys_exe(xsdFrom, xsdTo):
	xsdFromFile = os.path.join(xsdInstallBinaryDir, xsdFrom)
	xsdToFile = os.path.join(xsdInstallBinaryDir, xsdTo)
	if( os.path.exists(xsdFromFile) ):
		if not (os.path.exists(xsdToFile) ):
			print("Changing xsdcxx binary name from ["+xsdFromFile+"] to ["+xsdToFile+"]")
			shutil.move(xsdFromFile, xsdToFile)



#
# Main
#

print("Setting up windows platform dependencies for quasar - note this script may or may not work depending on the availability of external links. No guarantees, sorry!")
print('And another thing: Administrator rights required! Python must be invoked from CMD window opened with Administrator privileges - or this script WILL fail')
if platform.system() != "Windows":
	print("Strange... is this script running on a windows platform? Python's platform.system() call returns [platform.system()]. EXITING!")
	sys.exit('EXITING! python identifies this platform as (non-windows?) platform [{0}], was expecting [Windows]'.format(platform.System()))
else:
	print("It's a _windows_ system, I know this...\n")

setup_downloads_directories()
download_file(downloaded_files['LXML'], downloaded_files['LXML_URL'])
download_file(downloaded_files['PYSVN'], downloaded_files['PYSVN_URL'])
download_file(downloaded_files['ASTYLE'], downloaded_files['ASTYLE_URL'])
download_file(downloaded_files['BOOST'], downloaded_files['BOOST_URL'])
download_file(downloaded_files['LIBXML2'], downloaded_files['LIBXML2_URL'])
download_file(downloaded_files['XSD'], downloaded_files['XSD_URL'])
download_file(downloaded_files['XERCES'], downloaded_files['XERCES_URL'])
download_file(downloaded_files['OPENSSL'], downloaded_files['OPENSSL_URL'])

run_command('upgrade pip', 'C:\Python27\Scripts\pip', 'install --disable-pip-version-check --user --upgrade pip')
run_command('install python lxml', 'C:\Python27\Scripts\pip', 'install {0}'.format(downloaded_files['LXML']))
run_command('unzip astyle', windows_tools['UNZIP'], windows_tools['UNZIP_ARGS'].format(downloaded_files['ASTYLE'], downloadsDir))
run_command('unzip boost', windows_tools['UNZIP'], windows_tools['UNZIP_ARGS'].format(downloaded_files['BOOST'], downloadsDir))
run_command('unzip libxml2', windows_tools['UNZIP'], windows_tools['UNZIP_ARGS'].format(downloaded_files['LIBXML2'], downloadsDir))

run_command('install codesynthesis xsd', windows_tools['MSI'], windows_tools['MSI_ARGS'].format(downloaded_files['XSD']) )
rename_codesynthesys_exe('xsd.exe', 'xsdcxx.exe')

run_command('unzip xerces', windows_tools['UNZIP'], windows_tools['UNZIP_ARGS'].format(downloaded_files['XERCES'], downloadsDir))
run_command('install openssl', windows_tools['EXE_INSTALLER'].format(downloaded_files['OPENSSL']), windows_tools['EXE_INSTALLER_ARGS'])

print('===============================================================================================================================')
print('==GREAT! all windows dependencies setup and installed on this machine. BUT! local PATH variable must be set to use dependencies')
print('==Generating file \'setLocalPath.bat\' - run this in the local CMD window to set PATH accordingly)                             ')
libxml2Bin=os.path.join(downloadsDir, downloadsDir, 'libxml2', 'v2.7.8_64BIT', 'win32', 'bin.msvc')
astyleBin=os.path.join(downloadsDir, 'AStyle', 'bin')
setPATH = 'SET PATH=%PATH%;{0};{1};{2}'.format(xsdInstallBinaryDir, libxml2Bin, astyleBin)
setBOOST = 'SET BOOST_HOME={0}'.format(os.path.join(downloadsDir, 'boost_1_59_0_VS2013'))
setLIBXML2 = 'SET LIBXML2={0}'.format(libxml2Bin)
setCODE_SYNTHESYS_XSD = 'SET CODE_SYNTHESYS_XSD={0}'.format(xsdInstallDir)
setXERCES = 'SET XERCESC={0}'.format(os.path.join(downloadsDir, 'xerces-c-3.1.2', 'Build', 'Win64'))
write_file('setLocalPath.bat', '{0}\n{1}\n{2}\n{3}\n{4}'.format(setPATH, setBOOST, setLIBXML2, setCODE_SYNTHESYS_XSD, setXERCES))
print('===============================================================================================================================')
