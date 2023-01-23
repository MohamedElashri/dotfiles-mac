###  Terminal ###




########################
### Development ###

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

function dbash() {
  # Bash into running container
  docker exec -it $(docker ps -aqf "name=$1") bash;
}


function crun() {
  mkdir -p "build" && g++ $1.cpp -std=c++17 -o build/$1.out && ./build/$1.out
}

## Git ## 

# Go to project root
function git_root() {
  cd "$(git rev-parse --show-toplevel)"
}

# Find when arg $1 was introduced in file $2
function git_search() {
  git log -S "$1" --source --all $2
}
######





########################

trash() { command mv "$@" $HOME/.Trash ; } # move files to trash
#cat() { bat "$@" ; } # Use bat instead of cat
zipf() { zip -r "$1".zip "$1" ; } # To create a ZIP archive of a folder


# Extract most know archives with one command
extract() {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}



########################


### OS ###
# Display useful host related information
ii() {
    echo -e "\n${COL_GREEN}You are currently logged in to:$COL_RESET " ; echo -e $HOSTNAME
    echo -e "\n${COL_GREEN}Additional information:$COL_RESET $NC " ; uname -a
    echo -e "\n${COL_GREEN}Users logged on:$COL_RESET $NC " ; w -h
    echo -e "\n${COL_GREEN}Current date:$COL_RESET $NC " ; date
    echo -e "\n${COL_GREEN}Machine stats:$COL_RESET $NC " ; uptime
    echo -e "\n${COL_GREEN}Current network location:$COL_RESET $NC " ; scselect
    echo -e "\n${COL_GREEN}Public facing IP Address:$COL_RESET $NC " ; myip
    echo
}

# function to find a file with specific name in current folder
fff() {
  local file_name=$1
  find . -name "$file_name"
}
# search for files that start with a specific string
ffs() {
  local prefix=$1
  find . -name "$prefix*"
}
# search for files that ends with a specific string
ffe() {
  local suffix=$1
  find . -name "*$suffix"
}


# Normalize `open` across Linux, macOS, and Windows.
# This is needed to make the `o` function (see below) cross-platform.
if [ ! $(uname -s) = 'Darwin' ]; then
	if grep -q Microsoft /proc/version; then
		# Ubuntu on Windows using the Linux subsystem
		alias open='explorer.exe';
	else
		alias open='xdg-open';
	fi
fi

# Create a new directory and enter it
function mkd() {
  mkdir -p "$@" && cd "$_";
}
########################


### Docker ###
function dalias() {
  # Show all docker aliases
  alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/" | sed "s/['|\']//g" | sort;
  alias | grep '__d' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/" | sed "s/['|\']//g" | sort;
}
function dbash() {
  # Bash into running container
  docker exec -it $(docker ps -aqf "name=$1") bash;
}
function dip() {
  # Inspect running container
  for container in "$@"; do
    docker inspect -f "{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}" "${container}";
  done
}
function dst() {
  # Show stats for running container
  if [[ -z $1 ]]; then
    docker stats --no-stream --format 'table {{.Name}}\t{{.CPUPerc}}\t{{.MemPerc}}\t{{.MemUsage}}\t{{.NetIO}}\t{{.PIDs}}';
  else
    docker stats --no-stream --format 'table {{.Name}}\t{{.CPUPerc}}\t{{.MemPerc}}\t{{.MemUsage}}\t{{.NetIO}}\t{{.PIDs}}' | grep $1;
  fi
}
function dstop() {
  # Stop running containers
  if [[ $# -eq 0 ]]; then
    docker stop $(docker ps -aq --no-trunc);
  else
    for container in "$@"; do
      docker stop $(docker ps -aq --no-trunc | grep ${container});
    done
  fi
}
function drm() {
  # Delete containers
  if [[ $# -eq 0 ]]; then
    docker rm $(docker ps -aq --no-trunc);
  else
    for container in "$@"; do
      docker rm $(docker ps -aq --no-trunc | grep ${container});
    done
  fi
}
function drmi() {
  # Delete images
  if [[ $# -eq 0 ]]; then
    docker rmi $(docker images --filter 'dangling=true' -aq --no-trunc);
  else
    for container in "$@"; do
      docker rmi $(docker images --filter 'dangling=true' -aq --no-trunc | grep ${container});
    done
  fi
}

########################


### Misc ###

# Cheatsheets https://github.com/chubin/cheat.sh
function cht() {
  curl https://cheat.sh/$1
}

# Show frequently used commands
function freq_cmd() {
  if [[ -n "$1" ]]; then
    history | awk '{print $4}' | sort | uniq -c | sort -nr | head -n $1
  else
    history | awk '{print $4}' | sort | uniq -c | sort -nr | head
  fi
}
