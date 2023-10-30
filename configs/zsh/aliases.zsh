
### Files ###

alias l='pwd && ls'  
alias ls='ls --color=auto' # Colorize the ls output
alias ll='ls -la' # Use a long listing format
alias l.='ls -d .* --color=auto' # Show hidden files
alias ld="ls -D" # List only directories
alias ls='exa' # Use exa instead of ls
alias grep='grep --color=auto' # Colorize the grep output
alias egrep='egrep --color=auto' # Colorize the egrep output
alias fgrep='fgrep --color=auto' # Colorize the fgrep output
alias du='dust' # Use dust instead of du
alias df='duf' # Use duf instead of df
##  Skip confirmation for basic commands
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
#alias rm='rm -I --preserve-root'
alias rm='rm -i ' # -I is not supported on mac
alias mergepdf='gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=_merged.pdf' # Merge PDF files, preserving hyperlinks. Usage: `mergepdf input{1,2,3}.pdf
alias mkdir="mkdir -p" # Create intermediate directories as required
alias chown='chown --preserve-root' # prevent accidental root ownership
alias chgrp='chgrp --preserve-root' # prevent accidental root ownership
alias usage='du -ch | grep total' # show usage of current directory
alias totalusage='df -hl --total | grep total' # show usage of all mounted filesystems

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"

alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete" # Cleanup .DS_Store files

## Directories
alias sites="cd $HOME/Sites"
alias github='cd /Users/melashri/Desktop/projects/Github'
alias lhcb= 'cd /Users/melashri/Desktop/projects/LHCb'
alias doc='cd ~/Documents/'
alias ds='cd ~/.ssh'
alias dz='cd ~/.dotfiles'
alias de='cd ~/Desktop'
alias dq='cd ~/Downloads'
alias dls='cd ~/Library/Services'
alias dbin='cd /usr/local/bin/'

### Terminal utilites ###

alias c='clear' # clear terminal shortcut
#alias cd..='cd' # get rid of command not found
alias mount='mount |column -t' # human readable mount output
alias h='history' # show history
alias j='jobs -l' # show job ids
alias e='exit' #exit terminal
alias reload='source ~/.zshrc' #reload terminal
alias stats='zsh_stats' #terminal stats
alias profile='nano ~/.zshrc' # access zshrc
alias speedup="sudo rm -rf /private/var/log/asl/*" # Speed-up Terminal load time by clearing system logs
alias root='sudo -i' # Gain root
alias su='sudo -i' # Gain root 
alias sudo='sudo ' # Enable aliases to be sudo’ed
alias edit_nano='nano ~/.nanorc' # edit nano settings
alias path='echo -e ${PATH//:/\\n}' # Print each PATH entry on a separate line
alias restart_shell="exec ${SHELL} -l" # Restart shell (i.e. invoke as a login shell)
alias pycat='pygmentize -g' # syntax highlight files
alias cat='ccat' # for colorized cat(faster than pycat)
alias zshconfig='nano ~/.zshrc' # edit zshrc
alias bat='cat' # Use bat instead of cat
alias hidedesktop='defaults write com.apple.finder CreateDesktop -bool false && killall Finder'
alias showdesktop='defaults write com.apple.finder CreateDesktop -bool true && killall Finder'
alias export='export' # Re-alias "export" to "export" to remove from history



## exit commands
alias :q="exit"
alias ext="exit"
alias xt="exit"
alias by="exit"
alias bye="exit"
alias die="exit"
alias quit="exit"




### MacOS && Software ###
alias update="sudo softwareupdate -i -a; brew update; brew upgrade" # Get OS X Software Updates, update Homebrew, and upgrade installed Homebrew packages
alias upgrade='brew upgrade' # Upgrade homebrew packages
alias killDS='find . -name *.DS_Store -type f -delete' # Delete all .DS_Store files in the folder
alias rest="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend" # Lock the screen (when going AFK)
alias find_apps='mdfind kMDItemAppStoreHasReceipt=1' # find installed apps from app store
alias spotoff="sudo mdutil -a -i off" # Disable Spotlight 
alias spoton="sudo mdutil -a -i on" # Re-enable Spotlight 
alias badge="tput bel" # Terminal bell
alias battery="pmset -g batt" # Battery info
alias battery-cycle="system_profiler SPPowerDataType | grep "Cycle Count" | awk '{print $3}'" # Battery cycle count
alias free="free -m" # Show free memory in MB
alias hn='clx' # open hacker news in terminal
alias firefox='open -a /Applications/Firefox.app' # open firefox
alias web='open -a /Applications/Firefox.app' # open firefox
alias safari="open /Applications/Safari.app" # open safari


### Development ###

alias diff='colordiff' # Use colordiff for diff
alias kill_gpg='killall gpg-agent'  # kill gpg agent to be able to sign commits
alias record='asciinema rec' # Record terminal session
alias nano='micro' ## use micro editor
alias vim='Nvim' ## use neovim
alias generate_password='LC_ALL=C tr -dc "[:alnum:]" < /dev/urandom | head -c 20 | pbcopy' # Generate a random password and copy it to the clipboard
alias gcc13='gcc-13' # use gcc 13 from homebrew
alias gcc12='gcc-12' # use gcc 12 from homebrew
## Git
alias gst="git status"
alias gb="git branch"
alias gc="git checkout"
alias gl="git log --oneline --decorate --color"
alias amend="git add . && git commit --amend --no-edit"
alias commit="git add . && git commit -m"
alias diff="git diff"
alias force="git push --force"
alias nuke="git clean -df && git reset --hard"
alias pop="git stash pop"
alias pull="git pull"
alias push="git push"
alias resolve="git add . && git commit --no-edit"
alias stash="git stash -u"
alias unstage="git restore --staged ."
alias wip="commit wip"
# Git Diff
alias gd='git diff'
alias gds='git diff --staged'
alias gdn='git diff --name-only'

### Networking ###
 
alias clear_dns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder' # clear DNS cache
alias ping='ping -c 5' # ping 5 times only
alias ports='netstat -tulanp' # show all open ports
alias wget='wget -c' # continue stopped downloads
alias localip="ipconfig getifaddr en0" # get local ip address
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'" # get local ip address
alias myip='curl ifconfig.me && echo' # get public ip address
alias ip6_on='sudo networksetup -setv6automatic Wi-Fi' # enable ipv6
alias ip6_off='sudo networksetup -setv6off Wi-Fi' # disable ipv6
alias speedtest='speedtest-cli' # test internet speed
alias edit_host='sudo nano /etc/hosts' # edit hosts file



### Misc ### 
alias weather="curl https://wttr.in/Florianopolis | head -7" # weather



