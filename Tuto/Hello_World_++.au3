#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.12.0
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
$value = InputBox("My InputBox", "Saisir une valeur ici")
If @error = 0 Then
    MsgBox(0, "Tutorial", "Hello World!" & $value)
Else
    MsgBox(0, "Tutorial", "Goodbye World!")
EndIf
