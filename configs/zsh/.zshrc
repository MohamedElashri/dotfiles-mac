# =============================================================================
# Powerlevel10k Instant Prompt (ABSOLUTE TOP, before anything else)
# =============================================================================
# Disable instant prompt on Warp (P10k isn't loaded there in your config).
if [[ $TERM_PROGRAM == "WarpTerminal" ]]; then
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
else
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi
fi

# =============================================================================
# Amazon Q Integration (must be AFTER instant prompt)
# =============================================================================
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"

# =============================================================================
# Source Configuration Files (in correct order)
# =============================================================================

# Environment (PATH, OMZ, exports, lazy functions) — loads Oh My Zsh + P10k.
source "$HOME/environment.zsh"

# Core shell configuration
source "$HOME/config.zsh"

# Aliases
source "$HOME/aliases.zsh"

# Custom functions
source "$HOME/functions.zsh"

# Plugin-specific configuration (zstyle settings, etc.)
source "$HOME/plugins.zsh"

# =============================================================================
# Shell Integrations
# =============================================================================

# iTerm2 shell integration
[[ -e "${HOME}/.iterm2_shell_integration.zsh" ]] && source "${HOME}/.iterm2_shell_integration.zsh"

# =============================================================================
# Optimized Completions (after all plugins are loaded)
# =============================================================================

# Add custom completion directory
fpath=("$HOME/.zsh/completion" $fpath)

# Fast compinit with caching
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.zsh/cache"
[[ -d "$HOME/.zsh/cache" ]] || mkdir -p "$HOME/.zsh/cache"

autoload -Uz compinit
local zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
if [[ -s "$zcompdump" && ( "$zcompdump" -nt "$HOME/.zshrc" || "$zcompdump" -nt "$HOME/.zsh/completion" ) ]]; then
  compinit -C -d "$zcompdump"
else
  compinit -d "$zcompdump"
  [[ -f "$zcompdump.zwc" ]] || zcompile "$zcompdump"
fi

# =============================================================================
# Amazon Q Integration (post)
# =============================================================================
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh