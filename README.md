# PlaceWorkers dotfiles

Nach einem cleaninstall von OSX läd das Terminal beim öffnen eines neuen Fensters/Tabs sogenannte dotfiles (z.B. `~/.profile`), falls vorhanden. Dort können Konfigurationen definiert werden, die z.B. das Aussehen oder Verhalten des Terminals betreffen.

Dieses Repository enthält einige nützliche Konfigurationen für PlaceWorkers. Hier ein Vorher/Nachher-Bild des Terminals:

![PlaceWorkers Terminal](./placeworkers-dotfiles.png)

Bei Fragen oder Problemen gerne an [Nils](mailto:mail@der-zyklop.de) wenden.

## Installation

### Installation der Dotfiles

Navigiere in deinen User-Ordner:

    cd ~

Lade dir die Dotfiles per:

    git clone https://github.com/PlaceWorkersGmbH/dotfiles.git ~/.dotfiles

Die neuen dotfiles liegen jetzt im Ordner `~/.dotfiles`. Die installation startest du indem du die init-datei ausführst:

    sh ~/.dotfiles/init_dotfiles.sh

Nun schließe das Terminal und öffne es wieder. 

Folgendes ist im Hintergrund passiert: 

- Symlinks für die dotfiles dieses Repositories wurden im User-Ordner gespeichert
- Falls bei dir eine .bash_profile vorhanden ist, wird dessen content in ~/.extra verschoben

### Installation der auto-completion für u.a. git

Wenn du auto-completion für (u.a.) Git auch haben möchtest, führe noch folgendes script aus:

    sh ~/.dotfiles/init_brew.sh

Hierdurch wird [brew](http://brew.sh/) (Package-Manager für OSX) installiert.

## Neue commands

Nach der installation stehen dir ein paar nützliche neue commands (oder besser aliasse) zur Verfügung:

- `showdotfiles` ➡ Versteckte Dateien im Finder und auf dem Desktop **immer anzeigen**.
- `hidedotfiles` ➡ Versteckte Dateien im Finder und auf dem Desktop **nie anzeigen**.
- `hidedesktop` ➡ Alle Dateien auf dem Desktop ausblenden (nützlich bei Präsentationen)
- `showdesktop` ➡ Alle Dateien auf dem Desktop anzeigen.
- `showfinderpath` ➡ Zeige den gesammten Pfad im Finder-Fenster.
- `hidefinderpath` ➡ Zeige nur den Ordner-Namen im Finder-Fenster.
- `s ./path/to/dir/or/file/` ➡ Öffne Ordner oder Datei in Sublime Text ([v2](http://www.sublimetext.com/) oder [v3](http://www.sublimetext.com/3))

## Eigene Konfigurationen

Wenn du eigene Konfigurationen hinzufügen möchtest, die nur deinen Rechner betreffen und/oder die nichts im placeworkers-dotfiles Repository zu suchen haben, dann schreibe diese in `~/.extra`.

## Update

Geht so:

    cd ~/.dotfiles
    git pull

## Troubleshooting

Wenn dein Terminal irgendwann wieder aussieht wie nach einer OSX installation, dann existiert vermutlich eine `~/.bash_profile`. Wenn das Terminal eine `~/.bash_profile` findet, werden alle anderen Dotfiles ignoriert. 

Wenn in deiner `.bash_profile` etwas wichtiges steht, dann kannst du es in `~/.extra` übertragen.
