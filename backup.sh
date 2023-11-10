brew list > "lists/brew.txt"

# Backup cask packages
brew list --cask > "lists/cask.txt"

# Backup .zshrc and *.zsh files and overwrite the existing files

cp -f ~/.zshrc           	configs/zsh/.zshrc
cp -f ~/aliases.zsh      	configs/zsh/aliases.zsh
cp -f ~/plugins.zsh      	configs/zsh/plugins.zsh
cp -f ~/environment.zsh  	configs/zsh/environment.zsh
cp -f ~/config.zsh       	configs/zsh/config.zsh
cp -f ~/functions.zsh    	configs/zsh/functions.zsh
cp -f ~/shellhistory.zsh 	configs/zsh/shellhistory.zsh
cp -f ~/.p10k.zsh		 	configs/zsh/.p10k.zsh

# Backup git config file
cp -f ~/.gitconfig 			configs/git/.gitconfig
cp -f ~/.gitignore_global 	configs/git/.gitignore_global

# Backup vscode settings file
cp -f "$HOME/Library/Application Support/Code/User/settings.json" "configs/vscode/settings.json"
# backup vsocde extensions list
code --list-extensions > "configs/vscode/vs_code_extensions_list.txt"


# Backup Mac Installed fonts 
cp -f ~/Library/Fonts/* "configs/fonts/Fonts"
# Backup Fonts Collections
cp -f ~/Library/FontCollections/* "configs/fonts/FontCollections"
