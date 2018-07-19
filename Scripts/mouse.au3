#include <Misc.au3>

$left = 25
$up = 26
$right = 27
$down = 28
$ctrl = 11
$shift = 10
$enter = "0D"

While(true)
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


	Sleep(50)

WEnd