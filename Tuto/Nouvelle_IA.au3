#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.12.0
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

HotKeySet("{ESC}", "Terminate")

Opt('MouseCoordMode',0)
Opt('WinWaitDelay',100)

Func _WinWaitActivate($title,$text,$timeout=0)
	WinWait($title,$text,$timeout)
	If Not WinActive($title,$text) Then WinActivate($title,$text)
	WinWaitActive($title,$text,$timeout)
EndFunc

Func Terminate()
   Exit
EndFunc

$sel = 2
$numeroDM = "TEST_" & StringUpper(@UserName)

$valDelais = InputBox("Pour les besoins de la présentation","Délais entre chaque étape :",2000," M")
If @error <> 0 Then
	MsgBox(0,"","Le délais entre chaque étape est défini à 0")
	$valDelais = 20
EndIf

_WinWaitActivate("Apogée - APOD470","")
;~ While $sel < 21
	MouseClick("left",393,22,1)
	Send("{CTRLDOWN}q{CTRLUP}DM"&$numeroDM&"{TAB}DM"&$numeroDM&"_{SHIFTDOWN}"&$sel&"{SHIFTUP}")
	Sleep($valDelais)
	MouseClick("left",179,291,1)
	Send("01/01/198034{BACKSPACE}{BACKSPACE}034SETE{TAB}{TAB}F")
	Sleep($valDelais)
	Send("{TAB}{TAB}{TAB}{TAB}{TAB}2003{TAB}{TAB}{TAB}{TAB}")
	Sleep($valDelais)
	Send("S{SHIFTDOWN}{TAB}{SHIFTUP}2003{TAB}{TAB}{TAB}{TAB}34{TAB}")
	Sleep($valDelais)
	MouseClick("left",692,549,1) ;clic sur suivant
	Sleep(200); on attend la popup
	Sleep($valDelais)

	Send("{LEFT}{ENTER}") ; validation de popup
	Sleep(20)
	Sleep($valDelais)


	; ecran 2
	Send("{TAB}adresse{TAB}{TAB}{TAB}34000")
	Sleep($valDelais)
	Send("{TAB}{TAB}{TAB}{F9}")
	Sleep($valDelais)
	Send("{DOWN}{DOWN}{ENTER}")
	Sleep($valDelais)
	MouseClick("left",691,546,1)
	Sleep($valDelais)

	; ecran 3
	Send("{TAB}{TAB}{F9}{DOWN}{ENTER}{F9}")
	Sleep($valDelais)
	Send("{DOWN}{DOWN}{ENTER}{DOWN}")
	Sleep($valDelais)
	Send("{TAB}82{TAB}82")
	Sleep($valDelais)
	MouseClick("left",691,546,1)
	Sleep($valDelais)

	; ecran 4
	Send("{TAB}{TAB}{F9}")
	Sleep($valDelais)
	Send("{ENTER}{TAB}{TAB}")
	Sleep($valDelais)
	MouseClick("left",46,446,1)
	Sleep($valDelais)
	Send("DGDROI{F9}")
	Sleep($valDelais)
	Send("{ENTER}")
	Sleep($valDelais)
	MouseClick("left",398,553,1)
	Sleep($valDelais)
	MouseClick("left",707,551,1)

	; ecran 5
	Sleep($valDelais)
	MouseClick("left",707,551,1)

;~ 	; ecran 6
	Sleep($valDelais)
	MouseClick("left",390,555,1)
	Sleep($valDelais)
	Send("NU{TAB}700")
	Sleep($valDelais)
	MouseClick("left",408,563,1)
;~ 	MouseClick("left",248,548,1)
;~ 	MouseClick("left",510,415,1)
;~ 	MouseClick("left",510,415,1)
;~ 	MouseClick("left",510,415,1)
;~ 	MouseClick("left",510,415,1)
;~ 	MouseClick("left",510,415,1)
;~ 	MouseClick("left",510,415,1)
;~ 	MouseClick("left",510,415,1)

	sleep(2500)
	Sleep($valDelais)
	$sel = $sel+1

;~ WEnd

