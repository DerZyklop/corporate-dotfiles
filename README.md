# PlaceWorkers dotfiles

Nach einem cleaninstall von OSX läd das Terminal beim öffnen eines neuen Fensters/Tabs sogenannte dotfiles (z.B. `~/.profile`), falls vorhanden. Dort können Konfigurationen definiert werden, die z.B. das Aussehen oder Verhalten des Terminals betreffen.

Dieses Repository enthält einige nützliche Konfigurationen für PlaceWorkers. Bei Fragen oder Problemen gerne an [Nils](mailto:mail@der-zyklop.de) wenden.

## Installation

Navigiere in deinen User-Ordner:

    cd ~

Lade dir die Dotfiles per:

    git clone https://github.com/PlaceWorkersGmbH/dotfiles.git ~/.dotfiles

Die neuen dotfiles liegen jetzt im Ordner `~/.dotfiles`. Die installation startest du indem du die init-datei ausführst:

    sh ~/.dotfiles/init.sh

Was jetzt passiert ist folgendes: 

- Symlinks für die dotfiles dieses Repositories werden im User-Ordner gespeichert
- [brew](http://brew.sh/) (Package-Manager für OSX) wird installiert
- Gängige commandline tools werden per brew installiert
- Falls bei dir eine .bash_profile vorhanden ist, wird dessen content in ~/.extra verschoben

## Neue commands

Nach der installation stehen dir ein paar nützliche neue commands (oder besser aliasse) zur Verfügung:

- `showdotfiles` ➡ Versteckte Dateien im Finder und auf dem Desktop **immer anzeigen**.
- `hidedotfiles` ➡ Versteckte Dateien im Finder und auf dem Desktop **nie anzeigen**.
- `hidedesktop` ➡ Alle Dateien auf dem Desktop ausblenden (nützlich bei Präsentationen)
- `showdesktop` ➡ Alle Dateien auf dem Desktop anzeigen.
- `showfinderpath` ➡ Zeige den gesammten Pfad im Finder-Fenster.
- `hidefinderpath` ➡ Zeige nur den Ordner-Namen im Finder-Fenster.
- `ip4` ➡ Zeige die aktuelle IPv4-Adresse in der command line.
- `ip6` ➡ Zeige die aktuelle IPv6-Adresse in der command line.
- `o ./path/to/dir/or/file/` ➡ Öffne Ordner oder Datei im vorgesehenem Programm
- `s ./path/to/dir/or/file/` ➡ Öffne Ordner oder Datei in Sublime Text ([v2](http://www.sublimetext.com/) oder [v3](http://www.sublimetext.com/3))

## Eigene Konfigurationen

Wenn du eigene Konfigurationen hinzufügen möchtest, die nur deinen Rechner betreffen und/oder die nichts im placeworkers-dotfiles Repository zu suchen haben, dann schreibe diese in `~/.extra`.

## Troubleshooting

Wenn dein Terminal irgendwann wieder aussieht wie nach einer OSX installation, dann existiert vermutlich eine `~/.bash_profile`. Wenn das Terminal eine `~/.bash_profile` findet, werden alle anderen Dotfiles ignoriert. 

Wenn in deiner `.bash_profile` etwas wichtiges steht, dann kannst du es in `~/.extra` übertragen.
