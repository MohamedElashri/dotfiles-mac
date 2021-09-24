# Backup homebrew packages
brew list >> "lists/brew.txt"

# Backup cask packages
brew cask list >> "lists/cask.txt"

# Backup .zshrc
cat ~/.zshrc >> "configs/zsh/.zshrc"

# Backup git config file
cat  ~/.gitconfig >> "configs/git/.gitconfig"

# Backup vscode settings file
cat $HOME/Library/Application Support/Code/User/settings.json >> "configs/vscode/settings.json"