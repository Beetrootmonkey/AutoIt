While True
	WinWaitActive("Terraria")
	Click()
	Sleep(2500)
	Click()
	Sleep(2500)
WEnd

Func Click()
	MouseDown("left")
	Sleep(100)
	MouseUp("left")
EndFunc