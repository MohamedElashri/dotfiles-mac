# Pre-initialization blocks for external tools. These should stay at the top.
# CodeWhisperer pre block
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh"
# Fig pre block
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Source Powerlevel10k instant prompt if available
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Zsh configuration files
source $HOME/config.zsh
source $HOME/plugins.zsh
source $HOME/environment.zsh
source $HOME/aliases.zsh
source $HOME/functions.zsh
source $HOME/shellhistory.zsh

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Powerlevel10k configuration (duplicated line removed)
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# PATH configuration
export PATH="$PATH:$HOME/.local/bin"

# Custom scripts
$HOME/terminal_quran.sh
source $HOME/m_nvim.zsh

# Initialization of additional tools
eval "$(atuin init zsh)"

# Post-initialization blocks for external tools. These should stay at the bottom.
# Fig post block
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
# CodeWhisperer post block
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh"
