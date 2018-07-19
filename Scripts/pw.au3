#include <File.au3>
; INIT
Global $words
_FileReadToArray("passwords.txt", $words)
Global $tries = UBound($words)
Global $delay = 1000
Global $password = "n/v"
Global $path = "pw.txt"
Global $hFile = FileOpen($path)
Global $i = 0
Global $createFile = 1
Global $success = 0
If($hFile <> -1) Then
	$i = FileRead($hFile)
	$createFile = 0
EndIf


While $success <> 1

	; WAIT
	WinWaitActive("Channel Passwort")
	Sleep(200)

	; NOW GO
	While $i < $tries



		ClipPut($words[$i])
		Sleep($delay)

		If WinGetTitle("[active]") = "Channel Passwort" Then
			; Do nothing
		ElseIf WinGetTitle("[active]") = "TeamSpeak 3" Then
			Save()
			ExitLoop
		Else
			Save()
			ExitLoop 2
		EndIf

		Send("^v")
		Sleep($delay)

		If WinGetTitle("[active]") = "Channel Passwort" Then
			; Do nothing
		ElseIf WinGetTitle("[active]") = "TeamSpeak 3" Then
			Save()
			ExitLoop
		Else
			Save()
			ExitLoop 2
		EndIf

		Send("{ENTER}")
		$i += 1
	WEnd
WEnd


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Func Save()
If($createFile = 1) Then
		FileWrite($path, $i)
	Else
		_FileWriteToLine($path, 1,  $i, true)
	EndIf
EndFunc
