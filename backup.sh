#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color



# Function to check if a file exists and copy it
copy_file() {
  if [ -f "$1" ]; then
    cp -f "$1" "$2"
    echo -e "${GREEN}Copied $1 to $2${NC}"
  else
    echo -e "${YELLOW}File $1 does not exist. Skipping.${NC}"
  fi
}

# Function to check if a directory exists and create it if necessary
ensure_directory() {
  if [ ! -d "$1" ]; then
    mkdir -p "$1"
    echo -e "${BLUE}Created directory $1${NC}"
  fi
}

# Backup brew packages
brew list > "lists/brew.txt"
echo -e "${CYAN}Backed up brew packages to lists/brew.txt${NC}"

# Backup cask packages
brew list --cask > "lists/cask.txt"
echo -e "${CYAN}Backed up cask packages to lists/cask.txt${NC}"

# Backup config files
ensure_directory "configs/zsh"
copy_file ~/.zshrc configs/zsh/.zshrc
copy_file ~/.zprofile configs/zsh/.zprofile
copy_file ~/aliases.zsh configs/zsh/aliases.zsh
copy_file ~/plugins.zsh configs/zsh/plugins.zsh
copy_file ~/environment.zsh configs/zsh/environment.zsh
copy_file ~/config.zsh configs/zsh/config.zsh
copy_file ~/functions.zsh configs/zsh/functions.zsh
copy_file ~/shellhistory.zsh configs/zsh/shellhistory.zsh
copy_file ~/.p10k.zsh configs/zsh/.p10k.zsh

ensure_directory "configs/cli/bat"
copy_file ~/.config/bat/config configs/cli/bat/config

ensure_directory "configs/zed"
copy_file ~/.config/zed/settings.json configs/zed/settings.json

ensure_directory "configs/cli/atuin"
copy_file ~/.atuin/config.toml configs/cli/atuin/config.toml

ensure_directory "configs/ssh"
copy_file ~/.ssh/config configs/ssh/config

ensure_directory "configs/cli/helix"
copy_file ~/.config/helix/config.toml configs/cli/helix/config.toml

ensure_directory "configs/cli/nano"
copy_file ~/.nanorc configs/cli/nano/nanorc

ensure_directory "configs/cli/gh"
copy_file ~/.config/gh/config.yml configs/cli/gh/config.yml

ensure_directory "configs/cli/hyper"
copy_file ~/.hyper.js configs/cli/hyper/hyper.js

ensure_directory "configs/cli/"
copy_file ~/cli/terminal_quran.sh configs/cli/terminal_quran.sh
copy_file ~/cli/m_nvim.zsh configs/cli/m_nvim.zsh



# Backup git
ensure_directory "configs/git"
copy_file ~/.gitconfig configs/git/.gitconfig
copy_file ~/.gitignore_global configs/git/.gitignore_global
copy_file ~/.stCommitMsg configs/git/.stCommitMsg

# Backup vscode settings file
ensure_directory "configs/vscode"
copy_file "$HOME/Library/Application Support/Code/User/settings.json" "configs/vscode/settings.json"

# Backup VSCode extensions lists
ensure_directory "configs/vscode"
code --list-extensions --show-versions | awk '/\(disabled\)/{print $0 > "configs/vscode/vs_code_extensions_disabled_list.txt"; next} {print $0 > "configs/vscode/vs_code_extensions_enabled_list.txt"}'
code --list-extensions > "configs/vscode/vs_code_extensions_list.txt"
echo -e "${MAGENTA}Backed up VSCode extensions lists${NC}"

# Backup Fonts Collections
ensure_directory "configs/fonts/FontCollections"
cp -f ~/Library/FontCollections/* "configs/fonts/FontCollections"
echo -e "${MAGENTA}Backed up Font Collections${NC}"