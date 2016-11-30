# Install brew
# Info: http://brew.sh
if ! commandExists "brew"; then
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# This sets necessary brew permissions.
sudo chown -R $(whoami):admin /usr/local

# If brew was already installed, this is always a good thing to do.
brew update
brew upgrade
brew cleanup

# Brew package for auto-completion for commands on ⇥
brew install bash-completion

# Brew git package, because usually it‘s newer than the installed.
brew install git

# Use Brew‘s git even if there is another one.
brew link git --overwrite

