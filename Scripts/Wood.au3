#include <MsgBoxConstants.au3>
#include <Misc.au3>
#include <AutoItConstants.au3>

Local $run = False
Local $delay = 30

While True
	WinWaitActive("Minecraft 1.7.10")

	#Key 73 = F4
	If(_IsPressed(73)) Then
		$run = True
		Beep(600, 100)
	EndIf

	#Key 75 = F6
	If(_IsPressed(75)) Then
		$run = False
		Beep(300, 100)
	EndIf

	If($run = True) Then
	BoneMeal()
	Axe()
	Sapling()
	EndIf
WEnd

Func BoneMeal()
	Send("{9 down}")
	Sleep($delay)
    Send("{9 up}")
	Sleep($delay)

	Click(15, "right")
EndFunc

Func Axe()
	Send("{7 down}")
	Sleep($delay)
    Send("{7 up}")
	Sleep($delay)

	MouseDown("left")
	Sleep(1500)
	MouseUp("left")
EndFunc

Func Sapling()
	Send("{8 down}")
	Sleep($delay)
    Send("{8 up}")
	Sleep($delay)

	Click(1, "right")
EndFunc

Func SingleClick($side)
	MouseDown($side)
	Sleep($delay)
	MouseUp($side)
	Sleep($delay)
EndFunc

Func Click($times, $side)
	Local $i = 0

	While $i < $times
		SingleClick($side)
		$i = $i + 1
	WEnd
EndFunc