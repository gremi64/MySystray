#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.12.0
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
$value = InputBox("My InputBox", "Saisir une valeur ici")

If @error = 0 Then
   ShellExecute("http://lmgtfy.com/?q="&$value)
Else
   fonction1()
EndIf

Func fonction1()
   Run("notepad.exe")
   WinWaitActive("[CLASS:Notepad]", "", 10)
   Send("Il fallait cliquer sur ok {!}")
   Sleep(2000)
   ProcessClose("notepad.exe")
EndFunc
