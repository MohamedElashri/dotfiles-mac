# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# Q pre block. Keep at the top of this file.
# Pre-initialization blocks for external tools. These should stay at the top.
# CodeWhisperer pre block
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
#typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet


#### Powerlevel10k configuration START #####
# Source Powerlevel10k instant prompt if available
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Powerlevel10k configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
ZSH_THEME="wezm" # set by `omz`


#### Powerlevel10k configuration END #####


#### Zsh configuration files START #####
source $HOME/config.zsh
source $HOME/plugins.zsh
source $HOME/environment.zsh
source $HOME/aliases.zsh
source $HOME/functions.zsh
#source $HOME/shellhistory.zsh

#### Zsh configuration files END #####

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# Custom scripts
$HOME/cli/terminal_quran.sh
source $HOME/cli/m_nvim.zsh

# Post-initialization blocks for external tools. These should stay at the bottom.



# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"

# Added by Windsurf
export PATH="/Users/melashri/.codeium/windsurf/bin:$PATH"

#Add custom completion directory
fpath=(~/.zsh/completion $fpath)
autoload -U compinit && compinit
export PATH="/Users/melashri/.pixi/bin:$PATH"
