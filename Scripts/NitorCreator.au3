#include <MsgBoxConstants.au3>
#include <Misc.au3>
#include <AutoItConstants.au3>

Local $run = False
Local $delay = 60

While True
	WinWaitActive("FTB Interactions")

	If(_IsPressed(73)) Then
		$run = True
	EndIf
	If(_IsPressed(75)) Then
		$run = False
	EndIf

	If($run = True) Then
	Torch()
	Charcoal()
	Glowstone()
	EndIf
WEnd

Func Torch()
	Send("{1 down}")
	Sleep($delay)
    Send("{1 up}")
	Sleep($delay)

	Click(10)
EndFunc

Func Charcoal()
	Send("{2 down}")
	Sleep($delay)
    Send("{2 up}")
	Sleep($delay)

	Click(4)
EndFunc

Func Glowstone()
	Send("{3 down}")
	Sleep($delay)
    Send("{3 up}")
	Sleep($delay)

	Click(5)
EndFunc

Func SingleClick()
	MouseDown("right")
	Sleep($delay)
	MouseUp("right")
	Sleep($delay)
EndFunc

Func Click($times)
	Local $i = 0

	While $i < $times
		SingleClick()
		$i = $i + 1
	WEnd
EndFunc