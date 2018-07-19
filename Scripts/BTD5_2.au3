


Global const $check[4]
$check[0] = 0.8
$check[1] = 0.84
$check[2] = 0.12
$check[3] = 0.085


Main()

Func main()
	; Config laden, bzw generieren und laden

	; Ab und zu (1x alle 2 Sekunden?) testen, ob BTD5 das aktive Fenster ist
	; Wenn BTD5 das aktive Fenster ist, ab und an testen, ob man in einer Runde ist (anhand welchen Kriteriums??)
	; Solange man in einer Runde ist, soll relativ oft (mehrmals pro Sekunde) die rechts-untere Ecke gecheckt werden.
	; Dafür soll die PixelCheckSum gebildet werden, und mit dem aus der Config geladenen Wert verglichen werden.
	; Dieser gespeicherte Wert kann manuell mit einer Taste neu gesetzt = "fotografiert" werden

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
















