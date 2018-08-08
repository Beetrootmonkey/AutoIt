#include <MsgBoxConstants.au3>
#include <Misc.au3>
#include <AutoItConstants.au3>

Global $configPath = "Config.ini"
Global $window = "Bloons TD5"
Global $checksumCounter = 0

;      $cfg_variable  = [key, value, section]
Global $cfg_CheckX[3] = ["x", 0.8, "PauseCheck"]
Global $cfg_CheckY[3] = ["y", 0.84, "PauseCheck"]
Global $cfg_CheckW[3] = ["w", 0.12, "PauseCheck"]
Global $cfg_CheckH[3] = ["h", 0.085, "PauseCheck"]
Global $cfg_Checksum[3] = ["checksum", 0, "PauseCheck"]
Global $cfg_CheckDelay[3] = ["delay", 100, "PauseCheck"]

Global $cfg_ChecksumKey[4] = ["Snapshot(F1)", 70, "Keys", False]
Global $cfg_ReloadConfigKey[4] = ["ReloadConfig(F2)", 71, "Keys", False]

main()

Func main()
	reloadConfig()

	While(True)
		If WinWaitActive($window) Then
			If checkKey($cfg_ChecksumKey) Then
				Local $checksum = calcChecksum()
				If $checksum <> Null Then
					$cfg_Checksum[1] = $checksum
					writeToConfig($cfg_Checksum)
				EndIf
			EndIf
			If checkKey($cfg_ReloadConfigKey) Then
				reloadConfig()
			EndIf

			$checksumCounter += 1
			$checksumCounter = Mod($checksumCounter, 2)
			If $checksumCounter = 0 Then
				Local $checksum = calcChecksum()
				If $checksum <> Null Then
					Local $check = ($cfg_Checksum[1] = $checksum)
					If $check Then
						Send("{SPACE}")
					EndIf
				EndIf
			EndIf

		EndIf
		Sleep($cfg_CheckDelay[1])
	WEnd
EndFunc

Func getLocalCheckRect()
	Local $size = WinGetPos($window)
	If $size = Null Then
		Return Null
	EndIf
	Local $w = $size[2]
	Local $h = $size[3]
	Local $x1 = $w * $cfg_CheckX[1]
	Local $y1 = $h * $cfg_CheckY[1]
	Local $x2 = $x1 + $w * $cfg_CheckW[1]
	Local $y2 = $y1 + $h * $cfg_CheckH[1]
	Local $return = [$x1, $y1, $x2, $y2]
	Return $return
EndFunc

Func calcChecksum($debug = False)
	Local $rect = getLocalCheckRect()
	If $rect = Null Then
		Return Null
	EndIf
	Local $check = PixelChecksum($rect[0], $rect[1], $rect[2], $rect[3], 2)

	Return $check
EndFunc

Func checkKey(ByRef $key)
	Local $isPressed = _IsPressed($key[1])
	Local $wasPressed = $key[3]
	Local $return = False

	If $isPressed And Not $wasPressed Then
		$return = True
	EndIf

	$key[3] = $isPressed
	Return $return
EndFunc

Func reloadConfig()
	If Not FileExists($configPath) Then
		createConfig()
	EndIf
	loadConfig()
EndFunc

Func writeToConfig($val)
	IniWrite($configPath, $val[2], $val[0], $val[1])
EndFunc

Func readFromConfig(ByRef $val)
	$val[1] = IniRead($configPath, $val[2], $val[0], $val[1])
EndFunc

Func createConfig()
	writeToConfig($cfg_CheckX)
	writeToConfig($cfg_CheckY)
	writeToConfig($cfg_CheckW)
	writeToConfig($cfg_CheckH)
	writeToConfig($cfg_Checksum)
	writeToConfig($cfg_CheckDelay)

	writeToConfig($cfg_ChecksumKey)
	writeToConfig($cfg_ReloadConfigKey)

EndFunc


Func loadConfig()
	readFromConfig($cfg_CheckX)
	readFromConfig($cfg_CheckY)
	readFromConfig($cfg_CheckW)
	readFromConfig($cfg_CheckH)
	readFromConfig($cfg_Checksum)
	readFromConfig($cfg_CheckDelay)

	readFromConfig($cfg_ChecksumKey)
	readFromConfig($cfg_ReloadConfigKey)
EndFunc

















