While True
	WinWaitActive("Terraria")
	Click()
	Sleep(800)
	Click()
	Sleep(500)
WEnd

Func Click()
	MouseDown("left")
	Sleep(100)
	MouseUp("left")
EndFunc