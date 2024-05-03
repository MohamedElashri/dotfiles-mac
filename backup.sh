#!/bin/bash

# Function to check if a file exists and copy it
copy_file() {
  if [ -f "$1" ]; then
    cp -f "$1" "$2"
    echo "Copied $1 to $2"
  else
    echo "File $1 does not exist. Skipping."
  fi
}

# Function to check if a directory exists and create it if necessary
ensure_directory() {
  if [ ! -d "$1" ]; then
    mkdir -p "$1"
    echo "Created directory $1"
  fi
}

# Backup brew packages
brew list > "lists/brew.txt"

# Backup cask packages
brew list --cask > "lists/cask.txt"

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

# Backup git
ensure_directory "configs/git"
copy_file ~/.gitconfig configs/git/.gitconfig
copy_file ~/.gitignore_global configs/git/.gitignore_global
copy_file ~/.stCommitMsg configs/git/.stCommitMsg

# Backup vscode settings file
ensure_directory "configs/vscode"
copy_file "$HOME/Library/Application Support/Code/User/settings.json" "configs/vscode/settings.json"

# Backup vscode extensions list
code --list-extensions > "configs/vscode/vs_code_extensions_list.txt"

# Backup Fonts Collections
ensure_directory "configs/fonts/FontCollections"
cp -f ~/Library/FontCollections/* "configs/fonts/FontCollections"