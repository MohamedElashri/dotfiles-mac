# Path configurations
export PATH="/opt/homebrew/opt/python@3.8/bin:/usr/local/bin:$PATH"
export PATH="${PATH}:/Applications/terminal/ShellHistory.app/Contents/Helpers"

# Oh My Zsh configuration
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# Theme configuration
if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
    ZSH_THEME="powerlevel10k/powerlevel10k"
fi
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Python configuration
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Nix-shell
test -e "${HOME}/.nix-profile/etc/profile.d/nix.sh" && source "${HOME}/.nix-profile/etc/profile.d/nix.sh"

# iTerm2 integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Micro editor true color support
export MICRO_TRUECOLOR=1

# LS Colors
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

# Homebrew analytics and environment hints
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1

# GPG configuration
export GPG_TTY=$(tty)

# NVM configuration
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# VScode path
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Custom configurations
export INFISICAL_API_URL="https://secrets.elashri.xyz/api"
eval "$(op completion zsh)"; compdef _op op

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# 1password
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

# History configuration
export HISTFILE=~/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T] "
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
