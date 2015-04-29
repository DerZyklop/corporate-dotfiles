# PlaceWorkers dotfiles

Nach einem cleaninstall von OSX läd das Terminal beim öffnen eines neuen Fensters/Tabs als erstes die `~/.profile`, falls vorhanden. Dort können Konfigurationen definiert werden, die z.B. das Aussehen oder Verhalten des Terminals betreffen.

Dieses Repository enthält die standard dotfiles für PlaceWorkers. Bei Fragen oder Problemen gerne an [mich](mailto:mail@der-zyklop.de) wenden.

## Installation

### quick'n'dirty

    cd ~; mkdir .dotfiles; cd .dotfiles; curl -#L https://github.com/DerZyklop/placeworkers-dotfiles/archive/master.zip | tar -xzv --strip-components 1; sh init.sh;

### Installation der PlaceWorkers dotfiles mit Erklärung

Falls du git in deiner command line bereits installiert hast, lade dir die Dotfiles per:

    git clone https://github.com/DerZyklop/placeworkers-dotfiles.git ~/.dotfiles

Die neuen dotfiles liegen jetzt im Ordner `~/.dotfiles`. Die installation startest du indem du die init-datei ausführst. Das geht so:

    sh ~/.dotfiles/init.sh

Was jetzt passiert ist folgendes: 

- Symlinks für die dotfiles im User-Ordner setzen.
- XCode commandline tools installieren
- [brew](http://brew.sh/) (Package-Manager für OSX) installieren
- Gängige commandline tools per brew installieren (z.B. [git](http://git-scm.com/))
- OSX settings verändern (z.B. damit versteckte Dateien immer angezeigt werden)

## Neue commands

Nach der installation stehen dir ein paar nützliche neue commands (oder besser aliasse) zur Verfügung:

`showdotfiles` ➡ Versteckte Dateien im Finder und auf dem Desktop **immer anzeigen**.
`hidedotfiles` ➡ Versteckte Dateien im Finder und auf dem Desktop **nie anzeigen**.

`hidedesktop` ➡ Alle Dateien auf dem Desktop ausblenden (nützlich bei Präsentationen)
`showdesktop` ➡ Alle Dateien auf dem Desktop anzeigen.

`showfinderpath` ➡ Zeige den gesammten Pfad im Finder-Fenster.
`hidefinderpath` ➡ Zeige nur den Ordner-Namen im Finder-Fenster.

`ip4` ➡ Zeige die aktuelle IPv4-Adresse in der command line.
`ip6` ➡ Zeige die aktuelle IPv6-Adresse in der command line.

`o ./path/to/dir/or/file/` ➡ Öffne Ordner oder Datei im vorgesehenem Programm

`s ./path/to/dir/or/file/` ➡ Öffne Ordner oder Datei in Sublime Text ([v2](http://www.sublimetext.com/) oder [v3](http://www.sublimetext.com/3))

## Eigene Konfigurationen

Wenn du eigene Konfigurationen hinzufügen möchtest, die nur deinen Rechner betreffen und/oder die nichts im placeworkers-dotfiles Repository zu suchen haben, dann schreibe diese in `~/.extra`.
