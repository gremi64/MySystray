# My Systray
Ce programme ajoute une icone dans la barre des taches.

A partir de là vous pourrez utiliser vos propres raccourcis clavier ou lancer vos scripts/programmes.

Vous avez ici uniquement la base : une icone dans la barre des taches avec quelques menus et actions d'exemples. 
Vous **DEVEZ** l'adapter à **VOS** besoins. Pour cela il vous suffit d'installer autoit (environ 12mo actuellement) : https://www.autoitscript.com/site/autoit/downloads/

Lorsque vous lancez le .exe, un fichier de configuration basique est créé à titre d'exemple égament.
Vous avez aussi à disposition 3 fonctions utilisables par raccourci clavier :
- Ctrl+Shit+&   :   PERMET DE METTRE EN MAJUSCULE TOUT LE TEXTE SÉLECTIONNÉ.
- Ctrl+Shit+é   :   Permet De Mettre En Majuscule Le Début De Chaque Mot Et Le Reste En Minuscule.
- Ctrl+Shit+"   :   permet de mettre en minuscule tout le texte sélectionné.

***/!\ Ces fonctions passent par le presse papier /!\***

Ce qui signifie : 
- Vous aurez dans le presse papier le texte sélectionné à l'écran mais formatté (en majuscule, en minuscule, ...)
- Vous perdrez ce qui était dans le presse papier avant de lancer la fonction

De plus, ces raccourcis claviers sont valables tant que vous ne mettez pas le script en pause (un bouton dans le menu contextuel de l'icone est prévu à cet effet : 'Pause') ou que vous ne quittez pas le script.

## Icone
Si vous voulez créer votre icone perso : http://www.favicon.cc/
