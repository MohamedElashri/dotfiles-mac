### Files and Directories ###
#alias l='pwd && ls'
#alias ll='ls -la' # Use a long listing format
#alias l.='ls -d .* --color=auto' # Show hidden files
#alias ld="ls -D" # List only directories
#alias ls='eza' # Use exa instead of ls, overriding previous ls aliases
alias grep='grep --color=auto' # Colorize the grep output
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias du='dust' # Use dust instead of du
alias df='duf' # Use duf instead of df
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias rm='rm -i ' # -I is not supported on mac
alias mkdir="mkdir -p"
alias chown='chown --preserve-root'
alias chgrp='chgrp --preserve-root'
alias usage='du -ch | grep total'
alias totalusage='df -hl --total | grep total'
alias mergepdf='gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=_merged.pdf'
alias cleanDS="find . -type f -name '*.DS_Store' -ls -delete"

### Navigation Shortcuts ###
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias -- -='cd -'
alias github='cd $HOME/projects/github'
alias lhcb='cd $HOME/projects/lhcb'
alias cern='cd $HOME/projects/cern'
alias doc='cd ~/Documents/'
alias ds='cd ~/.ssh'
alias dz='cd ~/.dotfiles'
alias de='cd ~/Desktop'
alias dq='cd ~/Downloads'
alias dls='cd ~/Library/Services'
alias dbin='cd /usr/local/bin/'

### Terminal Utilities ###
alias c='clear'
alias mount='mount |column -t'
alias h='history'
alias j='jobs -l'
alias e='exit'
alias reload='source ~/.zshrc'
alias stats='zsh_stats'
alias profile='nano ~/.zshrc'
alias speedup="sudo rm -rf /private/var/log/asl/*"
#alias root='sudo -i'
alias sudo='sudo '
alias edit_nano='nano ~/.nanorc'
alias path='echo -e ${PATH//:/\\n}'
alias restart_shell="exec ${SHELL} -l"
alias pycat='pygmentize -g'
alias cat='bat' 
alias zshconfig='nano ~/.zshrc'
alias hidedesktop='defaults write com.apple.finder CreateDesktop -bool false && killall Finder'
alias showdesktop='defaults write com.apple.finder CreateDesktop -bool true && killall Finder'
alias export='export'

### Exit Commands ###
alias :q='exit'
alias ext='exit'
alias xt='exit'
alias by='exit'
alias bye='exit'
alias die='exit'
alias quit='exit'

### MacOS & Software ###
alias update="sudo softwareupdate -i -a; brew update; brew upgrade"
alias upgrade='brew upgrade'
alias killDS='find . -name *.DS_Store -type f -delete'
alias rest="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias find_apps='mdfind kMDItemAppStoreHasReceipt=1'
alias spotoff="sudo mdutil -a -i off"
alias spoton="sudo mdutil -a -i on"
alias badge="tput bel"
alias battery="pmset -g batt"
#alias battery-cycle="system_profiler SPPowerDataType | grep "Cycle Count" | awk '{print $3}'"
alias hn='clx'
alias firefox='open -a /Applications/Firefox\ Developer\ Edition.app/'
alias orion='open -a /Applications/browsers/Orion\ RC.app/'
alias arc='open -a /Applications/browsers/Arc.app/'
alias web='firefox'
alias safari="open /Applications/Safari.app"
alias top='htop'
alias ps='procs'

### Development ###
alias diff='colordiff'
alias kill_gpg='killall gpg-agent'
alias record='asciinema rec'
alias nano='micro' 
alias vim='Nvim'
alias gen_pass='LC_ALL=C tr -dc "[:alnum:]" < /dev/urandom | head -c 20 | pbcopy'
alias gcc13='gcc-13'
alias gcc12='gcc-12'
alias gcc14='gcc-14'
alias copilot='gh copilot'
alias explain='gh copilot explain'
alias ask='gh copilot suggest'
alias suggest='gh copilot suggest'
alias findgrep='GrePFind'

### Networking ###
alias clear_dns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
alias ping='ping -c 5'
alias ports='netstat -tulanp'
alias wget='wget -c'
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias myip='curl ifconfig.me && echo'
alias ip6_on='sudo networksetup -setv6automatic Wi-Fi'
alias ip6_off='sudo networksetup -setv6off Wi-Fi'
alias speedtest='speedtest-cli'
alias edit_host='sudo nano /etc/hosts'
alias bypass_xyz='dnscrypt-proxy -config ~/.config/dnscrypt-proxy/dnscrypt-proxy.toml'

### Misc ###
alias weather_cincy="curl https://wttr.in/Cincinnati | head -7" 
alias weather_home="curl https://wttr.in/Al+Mansurah,+Egypt | head -7" 
alias weather_cern="curl https://wttr.in/Geneva | head -7"
alias emergency="gh emergency"
alias depressed="gh emergency"
alias tired="gh emergency"
