# =============================================================================
# PATH Configurations
# =============================================================================

export PATH="/opt/homebrew/opt/python@3.8/bin:/usr/local/bin:$PATH"
export PATH="${PATH}:/Applications/terminal/ShellHistory.app/Contents/Helpers"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:$HOME/.local/bin"

# =============================================================================
# Oh My Zsh Configuration (with Powerlevel10k theme)
# =============================================================================

export ZSH="$HOME/.oh-my-zsh"

# Load P10k via OMZ unless on Warp.
if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
  ZSH_THEME="powerlevel10k/powerlevel10k"
else
  ZSH_THEME=""
fi

# Your plugins list
plugins=(history history-substring-search encode64 extract cp copypath copyfile autoupdate eza-zsh auto-notify zsh-apple-touchbar sublime git-extra-commands git zsh-syntax-highlighting zsh-autosuggestions tumult fd-zsh fzf-tab you-should-use insult-zsh)

# Prevent OMZ from running compinit (we handle it in .zshrc)
export skip_global_compinit=1

# Load Oh My Zsh (this initializes P10k when ZSH_THEME is set)
source "$ZSH/oh-my-zsh.sh"

# =============================================================================
# Tool Configurations
# =============================================================================

# Python
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Nix-shell
test -e "${HOME}/.nix-profile/etc/profile.d/nix.sh" && source "${HOME}/.nix-profile/etc/profile.d/nix.sh"

# Micro editor
export MICRO_TRUECOLOR=1

# LS Colors
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

# Homebrew
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1

# GPG
export GPG_TTY=$(tty)

# =============================================================================
# NVM Configuration (Lazy loading for fast startup)
# =============================================================================
export NVM_DIR="$HOME/.nvm"
nvm() {
  unset -f nvm
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && source "/opt/homebrew/opt/nvm/nvm.sh"
  nvm "$@"
}

# =============================================================================
# Other Tools
# =============================================================================

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# 1Password
export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
if command -v op >/dev/null 2>&1; then
  eval "$(op completion zsh 2>/dev/null)" || true
  [[ "$(whence -v compdef)" != "" ]] && compdef _op op
fi

# Infisical API
export INFISICAL_API_URL="https://secrets.elashri.xyz/api"

# =============================================================================
# History Configuration
# =============================================================================

export HISTFILE="$HOME/.zsh_history"
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T] "
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
