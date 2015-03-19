echo "${green}Want to install the new dotfiles?"
echo "${red}#####################################################"
echo "${red}ATTENTION: This will overwrite your current dotfiles!"
echo "${red}#####################################################"
read -p "${green}Should i?${reset} [yN] " -n 1 -r
echo "\nAllright!"
if [[ $REPLY =~ ^[Yy]$ ]]; then
	ln -sf .dotfiles/.aliases ~
	ln -sf .dotfiles/.bash_prompt ~
	ln -sf .dotfiles/.exports ~
	ln -sf .dotfiles/.functions ~
	ln -sf .dotfiles/.path ~
	ln -sf .dotfiles/.profile ~
	touch ~/.extra
fi

for file in ~/.{exports,path,completions,bash_prompt,aliases,functions,extra,bashrc}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

# Install XCode Command Line Tools
if [ $(xcode-select -p &> /dev/null; printf $?) -ne 0 ]; then
xcode-select --install &> /dev/null
	# Wait until the XCode Command Line Tools are installed
	while [ $(xcode-select -p &> /dev/null; printf $?) -ne 0 ]; do
			sleep 5
	done
fi

source ".functions"
# Install brew
if ! commandExists "brew"; then
	ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

brew update
brew upgrade
brew cleanup

# Install common brew packages
brew install bash-completion
brew install git
brew install node

# Install common node packages
npm update -g npm
npm update -g grunt
npm update -g grunt-cli
npm update -g jshint

# Change some OSX settings
showdotfiles
showfinderpath
