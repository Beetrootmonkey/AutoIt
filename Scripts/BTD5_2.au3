


Global const $check[4]
$check[0] = 0.8
$check[1] = 0.84
$check[2] = 0.12
$check[3] = 0.085


Main()

Func main()
	; Config laden, bzw generieren und laden

	;loop
		; If (BTD5 ist das aktive Fenster) Then
			; Nur alle paar Male ausführen, weil aufwendig
			; PixelCheckSum der rechts-unteren Ecke bilden
			; If (PCS = der aus der Config) Then
				; Leertaste drücken
			; EndIf
			; Dieser gespeicherte Wert kann manuell mit einer Taste neu gesetzt = "fotografiert" werden
		;EndIf

EndFunc



Func createDefaultConfig($path)




EndFunc


Func loadConfig($path)

	If Not FileExists($path) Then
		createDefaultConfig($path)
	EndIf

    IniWrite($sFilePath, "General", "Title", "AutoIt")

    Local $sRead = IniRead($sFilePath, "General", "Title", "Default Value")

    ; Display the value returned by IniRead.
    MsgBox($MB_SYSTEMMODAL, "", "The value of 'Title' in the section labelled 'General' is: " & $sRead)

    ; Delete the key labelled 'Title'.
    IniDelete($sFilePath, "General", "Title")

    ; Read the INI file for the value of 'Title' in the section labelled 'General'.
    $sRead = IniRead($sFilePath, "General", "Title", "Default Value")

    ; Display the value returned by IniRead. Since there is no key stored the value will be the 'Default Value' passed to IniRead.
    MsgBox($MB_SYSTEMMODAL, "", "The value of 'Title' in the section labelled 'General' is: " & $sRead)

    ; Delete the INI file.
    FileDelete($sFilePath)












EndFunc
















