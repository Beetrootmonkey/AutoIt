#include <MsgBoxConstants.au3>
#include <Misc.au3>
#include <AutoItConstants.au3>

Global $window = "BloonsTD6"
Global $delay = 50
Global $maxCounter = 5
Global $counter = 0
Global $paused = False
Global $pauseKey = 79 ; F10
Global $pausedKeyIsPressed = False
Global $resetKey = "7A" ; F11
Global $resetKeyIsPressed = False

Global $left = 25
Global $up = 26
Global $right = 27
Global $down = 28
Global $ctrl = 11
Global $shift = 10
Global $enter = "0D"

Global $NAME = 0
Global $FKEY = 1
Global $NKEY = 2
Global $ACTIVE = 3
Global $IS_PRESSED = 4

Global $keys[9][5]
For $i = 0 To 8
	$keys[$i][$Name] = "F" & ($i + 1)
	$keys[$i][$FKEY] = 70 + $i
	$keys[$i][$NKEY] = "{" & ($i + 1) & "}"
	$keys[$i][$ACTIVE] = False
	$keys[$i][$IS_PRESSED] = False
Next
main()

Func main()
	While(True)
		If WinActive($window) Then
			checkReset()
			updatePaused()
			doMouseStuff()

			For $i = 0 To 8
				Local $key[5] = [$keys[$i][$NAME], $keys[$i][$FKEY], $keys[$i][$NKEY], $keys[$i][$ACTIVE], $keys[$i][$IS_PRESSED]]
				updateKey($key, $i)
			Next

			If Not $paused Then
				$counter = Mod($counter + 1, $maxCounter)
				If $counter = 0 Then
					For $i = 0 To 8
						Local $key[5] = [$keys[$i][$NAME], $keys[$i][$FKEY], $keys[$i][$NKEY], $keys[$i][$ACTIVE], $keys[$i][$IS_PRESSED]]
						If $key[$ACTIVE] Then
							ConsoleWrite("Sending " & $key[$NAME] & @CRLF)
							Send($key[$NKEY])
						EndIf
					Next
				EndIf
			EndIf
		EndIf

		Sleep($delay)
	WEnd
EndFunc

Func updateKey($key, $i)
	Local $new_isPressed = _IsPressed($key[$FKEY])
	Local $old_isPressed = $key[$IS_PRESSED]
	Local $toggle = $new_isPressed And Not $old_isPressed

	$keys[$i][$IS_PRESSED] = $new_isPressed

	If $toggle Then
		If $key[$ACTIVE] Then
			Beep(300, 100)
			ConsoleWrite("Deactivating " & $key[$NAME] & @CRLF)
		Else
			Beep(600, 100)
			ConsoleWrite("Activating " & $key[$NAME] & @CRLF)
		EndIf
		$keys[$i][$ACTIVE] = Not $key[$ACTIVE]
	EndIf
EndFunc

Func updatePaused()
	Local $new_isPressed = _IsPressed($pauseKey)
	Local $old_isPressed = $pausedKeyIsPressed
	Local $toggle = $new_isPressed And Not $old_isPressed

	$pausedKeyIsPressed = $new_isPressed

	If $toggle Then
		If Not $paused Then
			Beep(300, 500)
			ConsoleWrite("Pausing" & @CRLF)
		Else
			Beep(600, 150)
			Beep(600, 150)
			Beep(600, 150)
			ConsoleWrite("Resuming" & @CRLF)
		EndIf
		$paused = Not $paused
	EndIf
EndFunc

Func checkReset()
	Local $new_isPressed = _IsPressed($resetKey)
	Local $old_isPressed = $resetKeyIsPressed
	Local $toggle = $new_isPressed And Not $old_isPressed

	$resetKeyIsPressed = $new_isPressed

	If $toggle Then
		For $i = 0 To 8
			$keys[$i][$ACTIVE] = False
			$keys[$i][$IS_PRESSED] = False
		Next

		Beep(600, 300)
		Beep(600, 300)
		Beep(600, 300)
		ConsoleWrite("Resetting" & @CRLF)
	EndIf
EndFunc

Func doMouseStuff()
	$pos = MouseGetPos()
	$x = $pos[0]
	$y = $pos[1]
	$movex = 0
	$movey = 0
	$speed = 2

	if _IsPressed($shift) Then
		$speed = 5
	EndIf
	if _IsPressed($ctrl) Then
		$speed = 1
	EndIf

	if _IsPressed($left) Then
		$movex-=$speed
	EndIf
	if _IsPressed($up) Then
		$movey-=$speed
	EndIf
	if _IsPressed($right) Then
		$movex+=$speed
	EndIf
	if _IsPressed($down) Then
		$movey+=$speed
	EndIf

	if $movex <> 0 Or $movey <> 0 Then
		MouseMove($x+$movex, $y+$movey)
	EndIf

	if _IsPressed($enter) Then
		MouseClick("left")
	EndIf
EndFunc

















