function cd-raydesktop {
	cd D:\work\rayDesktop
}

function cd-ray-toolbar {
	cd C:\Users\namek\work\ray-toolbars
}

function cd-release-toolbar {
	cd C:\Users\namek\work\build-ray-toolbars-Desktop_Qt_5_13_1_MSVC2017_32bit-Release
}

function do-release {
	 C:\Qt\5.13.1\msvc2017\bin\windeployqt.exe -qmldir=C:\Users\namek\work\ray-toolbars C:\Users\namek\work\build-ray-toolbars-Desktop_Qt_5_13_1_MSVC2017_32bit-Release\release\ray-toolbars.exe 
}

function cd-raydesktop-bin-toolbar-win32 {
	cd D:\work\rayDesktop\app\bin\ray-toolbar\win32
}

function release-toolbar-mv2-win32 {
	Write-Verbose "1. prepare release... ";
	Write-Verbose "1.1. rename win32 - win32.copy... ";	
	$job = Start-Job { Rename-Item -Path "D:\work\rayDesktop\app\bin\ray-toolbar\win32" -NewName "D:\work\rayDesktop\app\bin\ray-toolbar\win32.copy"; }
	Wait-Job $job
	Receive-Job $job
	
	$job2 = Start-Job { C:\Qt\5.13.1\msvc2017\bin\windeployqt.exe -qmldir=C:\Users\namek\work\ray-toolbars C:\Users\namek\work\build-ray-toolbars-Desktop_Qt_5_13_1_MSVC2017_32bit-Release\release\ray-toolbars.exe }	
	Wait-Job $job2	
	Receive-Job $job2	
	
	Write-Host "2. mv release dir to  ray-desktop-app-bin-toolbar-win32 ";	

	$job3 = Start-Job { Copy-Item -Path "C:\Users\namek\work\build-ray-toolbars-Desktop_Qt_5_13_1_MSVC2017_32bit-Release\release" -Destination "D:\work\rayDesktop\app\bin\ray-toolbar\win32" -Recurse -Force }
	Wait-Job $job3	
	Receive-Job $job3
	
	Write-Host "3. release done...";
	cd-raydesktop-bin-toolbar-win32;
	Remove-Item -Path "D:\work\rayDesktop\app\bin\ray-toolbar\win32.copy" -Recurse -Force
}

function release-raydesktop {
	cd-raydesktop;
	npm run package-win;
}

function open {
	explorer .
}


$exportModuleMemberParams = @{
    Function = @(
        	'cd-raydesktop',
      	'cd-ray-toolbar',
	'cd-release-toolbar',
	'do-release',
	'cd-raydesktop-bin-toolbar-win32',
	'release-toolbar-mv2-win32',
	'open',
	'release-raydesktop'
    )
}

Export-ModuleMember @exportModuleMemberParams