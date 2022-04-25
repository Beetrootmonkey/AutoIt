#include <MsgBoxConstants.au3>
#include <Misc.au3>
#include <AutoItConstants.au3>

Local $run = False
Local $delay = 50

While True
	WinWaitActive("FTB Interactions")

	If(_IsPressed(73)) Then
		$run = True
	EndIf
	If(_IsPressed(75)) Then
		$run = False
	EndIf

	If($run = True) Then
	RightClick()
	LeftClick()
	EndIf
WEnd


Func RightClick()
	MouseDown("right")
	Sleep($delay)
	MouseUp("right")
	Sleep($delay)
EndFunc

Func LeftClick()
	MouseDown("left")
	Sleep($delay)
	MouseUp("left")
	Sleep($delay)
EndFunc