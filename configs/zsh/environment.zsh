#export DOTFILES=$HOME/.dotfiles
export ZSH="/Users/melashri/.oh-my-zsh"
#ZSH_THEME="powerlevel10k/powerlevel10k"
if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
    ZSH_THEME="powerlevel10k/powerlevel10k"

fi

source $ZSH/oh-my-zsh.sh
export PATH=/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"
# export LANG=en_US.UTF-8
# export ARCHFLAGS="-arch x86_64"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="/opt/homebrew/opt/python@3.8/bin:$PATH"


# Micro
export MICRO_TRUECOLOR=1 # enable true color for micro


# nvm node version for Apple silicon
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Multiple Python support
eval "$(pyenv init -)"
#eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


# Nix-shell
#$HOME/.nix-profile/etc/profile.d/nix.sh
#. /Users/mohamedelashri/.nix-profile/etc/profile.d/nix.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# ShellHistory App
# adding shhist to PATH, so we can use it from Terminal
PATH="${PATH}:/Applications/ShellHistory.app/Contents/Helpers"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

# Homebrew
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1

## PGP
export GPG_TTY=$(tty)

## selfhost infistcal
export INFISICAL_API_URL="https://secrets.elashri.xyz/api"

## ipassword cli
eval "$(op completion zsh)"; compdef _op op

# history
export HISTFILE=~/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T] "
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
