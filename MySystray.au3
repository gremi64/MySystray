#cs ----------------------------------------------------------------------------

   AutoIt Version:   3.3.12.0
   Plateforme cible: Windows 7
   Author:           Jeremy Roulle

   Script Function:
   MySystray : Création d'une icone dans la barre des taches

   Ce programme a pour but de vous permettre :
	  - d'utiliser vos propres raccourcis clavier
	  - d'appeller vos propres scripts

#ce ----------------------------------------------------------------------------
Opt("TrayAutoPause", 0) ; Le script ne se mettra pas en pause quand l'utilisateur cliquera dessus.
Opt("TrayMenuMode", 2) ; Les items du menu ne seront pas sélectionnés.

#include <TrayConstants.au3>
#include <MsgBoxConstants.au3>
#include <Misc.au3>
#include <init.au3>

; Raccourcis clavier
; Utiliser Ctrl + Shift + Chiffre
HotKeySet("^+1", "UPPER_CASE")
HotKeySet("^+2", "Title_Case")
HotKeySet("^+3", "lower_case")

init()

Func _myMessage($texte)
	TrayTip($title, $texte, 10, 1)
EndFunc

; Modifie la casse du texte sélectionné : TOUT EN MAJUSCULE
Func UPPER_CASE()
	_SendEx("^{INSERT}")
	Sleep(10)
	$_x=clipget()

	$_x=StringUpper($_x)
	ClipPut($_x)
	Sleep(10)
	_SendEx("+{INSERT}")
EndFunc

; Modifie la casse du texte sélectionné : tout en minuscule
Func lower_case()
	_SendEx("^{INSERT}")
	Sleep(10)
	$_x=clipget()
	ClipPut(StringLower($_x))
	Sleep(10)
	_SendEx("+{INSERT}")
EndFunc

; Modifie la casse du texte sélectionné : Lettre De Début De Mot En Majuscule Le Reste En Minuscule
Func Title_Case()
	_SendEx("^{INSERT}")
	Sleep(10)
	$_x=clipget()
	$y=StringLeft($_x,1)
	$y1=$y
	$out=StringUpper($y)
	$_x=StringTrimLeft ($_x,1)


	for $i=0 to Stringlen($_x)
		$y=StringLeft($_x,1)
		;msgbox(1,"","_x =" & $_x & @CRLF & "y =" & $y & @CRLF & "y1 =" & $y1 & @CRLF & "out =" & $out)

		; Caratère précédent égal à tout caractère qui n'est pas dans [a-zA-Z] alors le prochain caractère est en MAJUSCULE
		if asc($y1)>90 and asc($y1)<97 or (asc($y1)<65 or asc($y1)>122 and asc($y1)<192) then
			$out=$out&StringUpper($y)
		else
			$out=$out&StringLower($y)
		endif
		$y1=StringLeft($_x,1)
		$_x=StringTrimLeft ($_x,1)
	next

	ClipPut($out)
	Sleep(10)
	_SendEx("+{INSERT}")
EndFunc

;Send the string $ss after the Shift Alt and Ctrl keys are released. Optionally give a warning after 1 sec if any of those keys are still down.
;Requires misc.au3 to be included in the script for the _IsPressed function.
; Permet de ne pas avoir les touches Shift Alt ou Ctrl "bloquées" par la commande "Send"
Func _SendEx($ss, $warn = "")
	Local $iT = TimerInit()

	While _IsPressed("10") Or _IsPressed("11") Or _IsPressed("12")
		If $warn <> "" And TimerDiff($iT) > 1000 Then
			MsgBox($MB_TOPMOST, "Warning", $warn)
		EndIf
		Sleep(10)
	WEnd
	Send($ss)
EndFunc;==>_SendEx
