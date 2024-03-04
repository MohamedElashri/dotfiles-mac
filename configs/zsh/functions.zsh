
########## Development ##########
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

########## Development ##########


########## System ##########

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



########## System ##########





########## External commands ##########



transfer()
{
    local file
    declare -a file_array
    file_array=("${@}")

    if [[ "${file_array[@]}" == "" || "${1}" == "--help" || "${1}" == "-h" ]]
    then
        echo "${0} - Upload arbitrary files to \"tr.melashri.eu.org\"."
        echo ""
        echo "Usage: ${0} [options] [<file>]..."
        echo ""
        echo "OPTIONS:"
        echo "  -h, --help"
        echo "      show this message"
        echo ""
        echo "EXAMPLES:"
        echo "  Upload a single file from the current working directory:"
        echo "      ${0} \"image.img\""
        echo ""
        echo "  Upload multiple files from the current working directory:"
        echo "      ${0} \"image.img\" \"image2.img\""
        echo ""
        echo "  Upload a file from a different directory:"
        echo "      ${0} \"/tmp/some_file\""
        echo ""
        echo "  Upload all files from the current working directory. Be aware of the webserver's rate limiting!:"
        echo "      ${0} *"
        echo ""
        echo "  Upload a single file from the current working directory and filter out the delete token and download link:"
        echo "      ${0} \"image.img\" | awk --field-separator=\": \" '/Delete token:/ { print \$2 } /Download link:/ { print \$2 }'"
        echo ""
        echo "  Show help text from \"transfer.sh\":"
        echo "      curl --request GET \"https://tr.melashri.eu.org\""
        return 0
    else
        for file in "${file_array[@]}"
        do
            if [[ ! -f "${file}" ]]
            then
                echo -e "\e[01;31m'${file}' could not be found or is not a file.\e[0m" >&2
                return 1
            fi
        done
        unset file
    fi

    local upload_files
    local curl_output
    local awk_output

    du -L "${file_array[@]}" >&2
    # be compatible with "bash"
    if [[ "${ZSH_NAME}" == "zsh" ]]
    then
        read $'upload_files?\e[01;31mDo you really want to upload the above files ('"${#file_array[@]}"$') to "tr.melashri.eu.org"? (Y/n): \e[0m'
    elif [[ "${BASH}" == *"bash"* ]]
    then
        read -p $'\e[01;31mDo you really want to upload the above files ('"${#file_array[@]}"$') to "tr.melashri.eu.org"? (Y/n): \e[0m' upload_files
    fi

    case "${upload_files:-y}" in
        "y"|"Y")
            # for the sake of the progress bar, execute "curl" for each file.
            # the parameters "--include" and "--form" will suppress the progress bar.
            for file in "${file_array[@]}"
            do
                # show delete link and filter out the delete token from the response header after upload.
                # it is important to save "curl's" "stdout" via a subshell to a variable or redirect it to another command,
                # which just redirects to "stdout" in order to have a sane output afterwards.
                # the progress bar is redirected to "stderr" and is only displayed,
                # if "stdout" is redirected to something; e.g. ">/dev/null", "tee /dev/null" or "| <some_command>".
                # the response header is redirected to "stdout", so redirecting "stdout" to "/dev/null" does not make any sense.
                # redirecting "curl's" "stderr" to "stdout" ("2>&1") will suppress the progress bar.
                curl_output=$(curl --request PUT --progress-bar --dump-header - --upload-file "${file}" "https://tr.melashri.eu.org/")
                awk_output=$(awk \
                    'gsub("\r", "", $0) && tolower($1) ~ /x-url-delete/ \
                    {
                        delete_link=$2;
                        print "Delete command: curl --request DELETE " "\""delete_link"\"";

                        gsub(".*/", "", delete_link);
                        delete_token=delete_link;
                        print "Delete token: " delete_token;
                    }

                    END{
                        print "Download link: " $0;
                    }' <<< "${curl_output}")

                # return the results via "stdout", "awk" does not do this for some reason.
                echo -e "${awk_output}\n"

                # avoid rate limiting as much as possible; nginx: too many requests.
                if (( ${#file_array[@]} > 4 ))
                then
                    sleep 5
                fi
            done
            ;;

        "n"|"N")
            return 1
            ;;

        *)
            echo -e "\e[01;31mWrong input: '${upload_files}'.\e[0m" >&2
            return 1
    esac
}

########## External commands ##########


########## OS ##########
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
########## OS ##########


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


########## Misc ##########
# Cheatsheets https://github.com/chubin/cheat.sh
function cheat() {
  curl https://cheat.sh/$1
}

# Show frequently used commands
function cmd() {

  history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10
}


# Show all aliases, functions, and scripts in user PATH
list_commands() {
  # List aliases
  echo "User-defined Aliases:"
  alias

  echo
  echo "User-defined Functions:"
  # List functions, excluding any that might be predefined by the shell itself or plugins
  # This filters out functions starting with an underscore, common in Zsh for internal or system functions
  typeset -f | awk '/^[a-zA-Z0-9]/ {print $1}' | while read -r function_name; do
    # Print the function name
    echo $function_name
    # Optionally, to print the function body as well, uncomment the next line
    # typeset -f $function_name
  done
}
########## Misc ##########
