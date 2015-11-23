#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.12.0
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

#include <MsgBoxConstants.au3>
#include <Excel.au3>
Opt('MouseCoordMode',0)

global $vitesseSouris = 0;


; Début script
MsgBox(0,"","Veuillez ouvrir un classeur Excel, coller une image dedans PUIS cliquer sur ok.")
WinWaitActive("[CLASS:XLMAIN]")

MsgBox(0,"","Effectuez un clic droit sur l'image puis 'Taille et propriétés'")
_WinWaitActivate("Taille et propriétés","")

Local $hWnd = WinWait("[TITLE:Taille et propriétés]", "", 10)
Local $sHauteur = Number(ControlGetText($hWnd, "", "[CLASS:RichEdit20W; INSTANCE:1]"))

If ($sHauteur >= 14) Then
	MouseClick("left",130,97,1,$vitesseSouris)
	ControlSetText($hWnd, "", "[CLASS:RichEdit20W; INSTANCE:1]", "")
	Send("14{TAB}")
EndIf

MouseClick("left",86,48,1,$vitesseSouris) ; Changement d'onglet (n°2)
MouseClick("left",137,123,1,$vitesseSouris) ; Deuxieme radio bouton
MouseClick("left",342,380,1,$vitesseSouris) ; Fermeture de la fenetre

; Fin script



Func _WinWaitActivate($title,$text,$timeout=0)
	WinWait($title,$text,$timeout)
	If Not WinActive($title,$text) Then WinActivate($title,$text)
	WinWaitActive($title,$text,$timeout)
EndFunc
