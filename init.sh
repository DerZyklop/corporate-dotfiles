echo "${green}Want to install the new dotfiles?"
echo "${red}#####################################################"
echo "${red}ATTENTION: This will overwrite your current dotfiles!"
echo "${red}#####################################################"
read -p "${green}Should i?${reset} [yN] " -n 1 -r
echo "\nAllright!"

if [[ $REPLY =~ ^[Yy]$ ]]; then
	for file in ~/.{aliases,bash_prompt,exports,functions,path,profile,gitconfig,extra}; do
		echo "${red}#####################################################"
		echo "${red}File $file exists! It needs to be deleted to install the new dotfiles."
		echo "${red}#####################################################"
		read -p "${green}Should i delete it?${reset} [yN] " -n 1 -r
		echo "\nAllright!"
		if [[ $REPLY =~ ^[Yy]$ ]]; then
			rm -rf $file
			#rm -rf ;
		fi;
	done;
	ln -s .dotfiles/.aliases ~
	ln -s .dotfiles/.bash_prompt ~
	ln -s .dotfiles/.exports ~
	ln -s .dotfiles/.functions ~
	ln -s .dotfiles/.path ~
	ln -s .dotfiles/.profile ~
	ln -s .dotfiles/.gitconfig ~
	touch ~/.extra
fi

for file in ~/.{exports,path,completions,bash_prompt,aliases,functions,extra,bashrc}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

source ".functions"
# Install brew
if ! commandExists "brew"; then
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew upgrade
brew cleanup

# Install common brew packages
brew install bash-completion
brew install git
# npm update -g jshint

# # Change some OSX settings
showdotfiles
showfinderpath
