echo "${green}This script will install new dotfiles and brew (http://brew.sh)"

if [[ -f ~/.aliases || -f ~/.bash_prompt || -f ~/.exports || -f ~/.functions || -f ~/.path || -f ~/.profile || -f ~/.gitconfig ]]; then
	echo "${red}#####################################################"
	echo "${red}ATTENTION: You have files on your computer that will be overwrittten!"
	echo "${red}Make sure to delete them first: "
fi;
for file in ~/.{aliases,bash_prompt,exports,functions,path,profile,gitconfig}; do
	if [ -f "$file" ]; then
		echo "${red}$file"
	fi;
done;
if [[ -f ~/.aliases || -f ~/.bash_prompt || -f ~/.exports || -f ~/.functions || -f ~/.path || -f ~/.profile || -f ~/.gitconfig ]]; then
	echo "${red}#####################################################"
fi;
read -p "${green}Continue with the installation process?${reset} [yN] " -n 1 -r

if [[ $REPLY =~ ^[Yy]$ ]]; then
	echo "\nContinuing..."
	for file in ~/.{aliases,bash_prompt,exports,functions,path,profile,gitconfig}; do
		if [ -f "$file" ]; then
			echo "${red}#####################################################"
			echo "${red}File $file still exists. It needs to be deleted to install the new dotfiles."
			echo "${red}#####################################################"
			read -p "${green}Should i delete it?${reset} [yN] " -n 1 -r
			echo "\nAllright!"
			if [[ $REPLY =~ ^[Yy]$ ]]; then
				rm -rf $file
				echo "${green}#####################################################"
				echo "${green} File deleted"
				echo "${green}#####################################################"
			fi;
		fi;
	done;
	ln -s ~/.dotfiles/.aliases ~
	ln -s ~/.dotfiles/.bash_prompt ~
	ln -s ~/.dotfiles/.exports ~
	ln -s ~/.dotfiles/.functions ~
	ln -s ~/.dotfiles/.path ~
	ln -s ~/.dotfiles/.profile ~
	ln -s ~/.dotfiles/.gitconfig ~

	touch ~/.extra

	# Copy .bash_profile content to .extra if .bash_profile exists
	if [[ -f ~/.bash_profile ]]; then
		cat ~/.bash_profile >> ~/.extra
		rm ~/.bash_profile
	fi;

	# This will make the content of the new dotfiles
	# awailable for the current Terminal window.
	for file in ~/.{exports,path,completions,bash_prompt,aliases,functions,extra,bashrc}; do
		[ -r "$file" ] && [ -f "$file" ] && source "$file";
	done;
	source ".functions"

	# The new appearence works best with dark background
	# Set new theme as default
	defaults write com.apple.terminal "Startup Window Settings" -string "Pro"
	defaults write com.apple.terminal "Default Window Settings" -string "Pro"
	defaults write com.apple.Terminal AppleFontSmoothing -int 1

	echo "\n${green}Done! 🍻${reset}"
else
	echo "\nStopped!"
fi
