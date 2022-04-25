#include <MsgBoxConstants.au3>
#include <Misc.au3>
#include <AutoItConstants.au3>

Global $window = "BloonsTD6"
Global $delay = 50
Global $exitKey = "7A" ; F11

Global $left = 25
Global $up = 26
Global $right = 27
Global $down = 28
Global $ctrl = 11
Global $shift = 10
Global $enter = "0D"

main()

Func main()
	While(True)
		If WinActive($window) Then
			checkIfExit()
			doMouseStuff()
		EndIf

		Sleep($delay)
	WEnd
EndFunc

Func checkIfExit()
	If _IsPressed($ctrl) And _IsPressed($shift) And _IsPressed($exitKey) Then
		Exit
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

















