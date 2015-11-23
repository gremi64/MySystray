#include-once

Global Const $title = "My Systray"

Global Const $configFile = @ScriptDir & "\Configuration.ini"

Global Const $section1 = "Section 1"
Global Const $section2 = "Section 2"
Global Const $section3 = "Section 3"

Global Const $defVal = "Valeur par d�faut"

Global Const $cle1 = "Cle 1"
Global Const $cle2 = "Cle 2"
Global Const $cle3 = "Cle 3"


; Permet de lire dans le fichier de configuration
Func _myIniRead($section, $cle)
	Return IniRead($configFile, $section, $cle, $defVal)
EndFunc

; Permet d'�crire dans le fichier de configuration
Func _myIniWrite($section, $cle, $defVal)
	IniWrite($configFile, $section, $cle, $defVal)
EndFunc


; initialisation du fichier de configuration
Func init()
	; Si le fichier de configuration n'existe pas il sera cr�� automatiquement dans le r�pertoire du script @ScriptDir ;

	; Assignation de valeurs ;
	; Si une valeur n'est pas assign�e et qu'on tente d'acceder � la cl�, on r�cup�rera "Valeur par d�faut"

	; Lit dans le fichier .INI la valeur de '$cle1' et '$cle2' dans la '$section1'.
	Local $sReadS1Cle1 = _myIniRead($section1, $cle1)
	; Si '$sReadS1Cle1' est �gal � la valeur par d�faut, on lui assigne une valeur, sinon on laisse la valeur actuelle
	If $sReadS1Cle1 = $defVal Then
		; Ecrit dans le fichier .INI la valeur 'Ma cl� 1' pour la cl� '$cle1' dans la '$section1'.
		_myIniWrite($section1, $cle1, "Ma cl� 1")
	EndIf

	; Lit dans le fichier .INI la valeur de '$cle1' et '$cle2' dans la '$section2'.
	Local $sReadS2Cle1 = _myIniRead($section2, $cle1)
	; Si '$sReadS2Cle1' est �gal � la valeur par d�faut, on lui assigne une valeur, sinon on laisse la valeur actuelle
	If $sReadS2Cle1 = $defVal Then
		; Ecrit dans le fichier .INI la valeur 'Mon autre cl� 1' pour la cl� '$cle1' dans la '$section2'.
		_myIniWrite($section2, $cle1, "Mon autre cl� 1")
	EndIf

	; Lit dans le fichier .INI la valeur de '$cle3' dans la '$section3'.
	Local $sReadS3Cle3 = _myIniRead($section3, $cle3)
	; Si '$sReadS2Cle1' est �gal � la valeur par d�faut, on lui assigne une valeur, sinon on laisse la valeur actuelle
	If $sReadS3Cle3 = $defVal Then
		; Ecrit dans le fichier .INI la valeur '//' pour la cl� '$cle3' dans la '$section3'.
		_myIniWrite($section3, $cle3, "//")
	EndIf

	; Appel de la fonction qui cr�� le menu
	createTrayMenu()

EndFunc

; Cr�ation du menu et affichage dans la barre des taches
Func createTrayMenu()

	; Action 1
	Local $idAction1 = TrayCreateItem("Action 1 - Bienvenue")

	TrayCreateItem("") ; Cr�� une ligne de s�paration.

	; Menu 1
	Local $idMenu1 = TrayCreateMenu("Exemples Basiques")
	Local $idM1Action1 = TrayCreateItem("Action 1 dans le Menu 1 - Hello World", $idMenu1)
	Local $idM1Action2 = TrayCreateItem("Action 2 dans le Menu 1 - Hello World ++", $idMenu1)
	Local $idM1Action3 = TrayCreateItem("Action 3 dans le Menu 1 - Hello World ++++", $idMenu1)

	; Menu 2
	Local $idMenu2 = TrayCreateMenu("Exemples Avanc�s")
	Local $idM2Action1 = TrayCreateItem("Action 1 dans le Menu 1 - Redimensionnement", $idMenu2)
	Local $idM2Action2 = TrayCreateItem("Action 2 dans le Menu 1 - Nouvelle IA (Apogee)", $idMenu2)

	; Affiche l'icone dans la barre des taches.
	TraySetState($TRAY_ICONSTATE_SHOW)

	; Renomme le bouton "Pause", qui permet (entre autres) de d�sactiver les raccourcis clavier
	TrayItemSetText($TRAY_ITEM_PAUSE, "Pause")
	; Renomme le bouton "Quitter"
	TrayItemSetText($TRAY_ITEM_EXIT, "Quitter")

;~ 	TraySetIcon(@ScriptDir & "\favicon.ico")

	TraySetToolTip($title)

	While 1
		Switch TrayGetMsg()

			Case $idAction1
				_myMessage('Bienvenue dans votre icone de barre des taches')

			; Exemples Basiques
			Case $idM1Action1
				ShellExecute(@ScriptDir & "\Tuto" & "\Hello_World.au3")

			Case $idM1Action2
				ShellExecute(@ScriptDir & "\Tuto" & "\Hello_World_++.au3")

			Case $idM1Action3
				ShellExecute(@ScriptDir & "\Tuto" & "\Hello_World_++++.au3")

			; Exemples Avanc�s
			Case $idM2Action1
				ShellExecute(@ScriptDir & "\Tuto" & "\Redimensionner_image_excel.au3")

			Case $idM2Action2
				ShellExecute(@ScriptDir & "\Tuto" & "\Nouvelle_IA.au3")

		EndSwitch

		Sleep(10)
	WEnd
EndFunc

