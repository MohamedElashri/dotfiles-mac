# MacOS System
# Remove Message of the day prompt
touch $HOME/.hushlogin
# Show hidden files in finder
defaults write com.apple.finder AppleShowAllFiles YES

# Basic file system setup
mkdir -p $HOME/work/git

# TODO: these both hijack the shell session and don't let the rest of this file complete
# Install zsh
#sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# Install brew
#/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


# setup GH token here
# https://github.com/settings/tokens/new?scopes=gist,public_repo&description=Homebrew
#and then set the token as: 
#export HOMEBREW_GITHUB_API_TOKEN="your_new_token"

# Install all homebrew packages
while IFS='' read -r line || [[ -n "$line" ]]; do
    brew install "$line"
done < "./lists/brew.txt"


# Install all cask packages
while IFS='' read -r line || [[ -n "$line" ]]; do
    brew cask install "$line"
done < "./lists/cask.txt"


# SSH config
stow ssh -t $HOME/


stow bash -t $HOME
rm $HOME/.zshrc
stow zsh -t $HOME

stow vscode -t $HOME
ln -s "$HOME/work/git/dotfiles/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
# If using  VSCodium instead replace by
#ln -s "$HOME/work/git/dotfiles/vscode/settings.json" "$HOME/Library/Application Support/VSCodium/User/settings.json"

# git
stow git -t $HOME/
git config --global core.excludesfile $HOME/.gitignore

