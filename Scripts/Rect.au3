#include <WindowsConstants.au3>
#include <WinAPI.au3>
#Include <GDIPlus.au3>
#Include <Misc.au3>

_GDIPlus_Startup ()

$hDC = _WinAPI_GetWindowDC(0)
$rf = 40
$rh = $rf / 2

$hGraphic = _GDIPlus_GraphicsCreateFromHDC($hDC)
$Color = 0xFF000000
$hPen = _GDIPlus_PenCreate($Color,2)
$start = True
$run = True
$runBg = True
$check = 0
$titel = "Bloons TD5"



While $runBg
	$start = True
	$run = True
	WinWaitActive($titel)

	While $start

		If Not WinActive($titel) Then
			$start = False
			$run = False
			ContinueLoop
		EndIf

		$handle = _IsPressed(70 , "user32.dll")
		$handleAbort = _IsPressed(72 , "user32.dll")
		If $handle Then
			$size = WinGetPos("[Active]")
			$x = $size[0]
			$y = $size[1]
			$w = $size[2]
			$h = $size[3]
			$x1 = $w * 0.77
			$y1 = $h * 0.84
			$x2 = $w - $x1
			$y2 = $h * 0.085

			$check = PixelChecksum($x + $x1, $y + $y1, $x + $w, $y + $y1 + $y2)

			_GDIPlus_GraphicsDrawRect($hGraphic, $x + $x1, $y + $y1, $x2, $y2, $hPen)
			Sleep(100)
			_WinAPI_RedrawWindow(_WinAPI_GetDesktopWindow(), 0, 0, $RDW_INVALIDATE+$RDW_ALLCHILDREN)
			$start = False
		ElseIf $handleAbort Then
			$start = False
			$run = False
			$runBg = False
		Else
			Sleep(100)
		EndIf
	WEnd



	While $run

		If Not WinActive($titel) Then
			$run = False
			ContinueLoop
		EndIf

		$handle = _IsPressed(71 , "user32.dll")
		$handleAbort = _IsPressed(72 , "user32.dll")
		If $handle Then
			$run = False
			ContinueLoop
		ElseIf $handleAbort Then
			$start = False
			$run = False
			$runBg = False
		EndIf

		$size = WinGetPos("[Active]")
		$x = $size[0]
		$y = $size[1]
		$w = $size[2]
		$h = $size[3]
		$x1 = $w * 0.77
		$y1 = $h * 0.84
		$x2 = $w - $x1
		$y2 = $h * 0.085

		If $check = PixelChecksum($x + $x1, $y + $y1, $x + $w, $y + $y1 + $y2) Then
			Send("{SPACE}")
			_GDIPlus_GraphicsDrawRect($hGraphic, $x + $x1, $y + $y1, $x2, $y2, $hPen)
			Sleep(100)
			_WinAPI_RedrawWindow(_WinAPI_GetDesktopWindow(), 0, 0, $RDW_INVALIDATE+$RDW_ALLCHILDREN)
		Else
			Sleep(100)
		EndIf
	WEnd
WEnd

_WinAPI_ReleaseDC(0, $hDC)
_GDIPlus_Shutdown()