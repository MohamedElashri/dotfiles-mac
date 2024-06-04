# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zprofile.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zprofile.pre.zsh"
# Q pre block. Keep at the top of this file.
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

# Q post block. Keep at the bottom of this file.

# Added by Toolbox App
export PATH="$PATH:/Users/melashri/Library/Application Support/JetBrains/Toolbox/scripts"

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zprofile.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zprofile.post.zsh"
