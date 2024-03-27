brew list > "lists/brew.txt"

# Backup cask packages
brew list --cask > "lists/cask.txt"

# Backup config files 
cp -f ~/.zshrc           	          configs/zsh/.zshrc
cp -f ~/aliases.zsh      	          configs/zsh/aliases.zsh
cp -f ~/plugins.zsh      	          configs/zsh/plugins.zsh
cp -f ~/environment.zsh  	          configs/zsh/environment.zsh
cp -f ~/config.zsh       	          configs/zsh/config.zsh
cp -f ~/functions.zsh    	          configs/zsh/functions.zsh
cp -f ~/shellhistory.zsh 	          configs/zsh/shellhistory.zsh
cp -f ~/.p10k.zsh                     configs/zsh/.p10k.zsh
cp -f ~/.config/bat/config            configs/cli/bat/config
cp -f ~/.config/zed/settings.json     configs/zed/settings.json
cp -f ~/.atuin/config.toml            configs/cli/atuin/config.toml
cp -f ~/.ssh/config                   configs/ssh/config
cp -f ~/.config/helix/config.toml     configs/cli/helix/config.toml
cp -f ~/.nanorc 					  configs/cli/nano/nanorc
cp -f ~/.config/gh/config.yml         configs/cli/gh/config.yml
cp -f ~/.hyper.js 					  configs/cli/hyper/hyper.js
                 

# Backup git
cp -f ~/.gitconfig 			 configs/git/.gitconfig
cp -f ~/.gitignore_global 	 configs/git/.gitignore_global
cp -f ~/.stCommitMsg         configs/git/.stCommitMsg

# Backup vscode settings file
cp -f "$HOME/Library/Application Support/Code/User/settings.json" "configs/vscode/settings.json"
# backup vsocde extensions list
code --list-extensions > "configs/vscode/vs_code_extensions_list.txt"


# Backup Mac Installed fonts
#find ~/Library/Fonts -type f -exec cp {} "configs/fonts/Fonts" \;
# Backup Fonts Collections
cp -f ~/Library/FontCollections/* "configs/fonts/FontCollections"
