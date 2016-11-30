# Load the other shell dotfiles.
# * ~/.extra can be used for your personal settings.

for file in $HOME/.{exports,path,aliases,bash_prompt,functions,extra,bashrc}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Add tab completion for many Bash commands in case you use brew
if commandExists "brew" && [ -f "$(brew --prefix)/etc/bash_completion" ]; then
  source "$(brew --prefix)/etc/bash_completion";
elif [ -f /etc/bash_completion ]; then
  source /etc/bash_completion;
fi;
