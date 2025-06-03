
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

# history() {
#     HIST_BACKUP_DIR="$HOME/.history/.history_backups"
#     FAVORITES_FILE="$HOME/.history/.history_favorites"

#     show_help() {
#         echo "History Wrapper - Enhanced shell history management"
#         echo
#         echo "Usage: history [options] [arguments]"
#         echo
#         echo "Options:"
#         echo "  <n>                       Show last n entries."
#         echo "  search <keyword>          Search for commands containing a specific keyword."
#         echo "  run <ID>                  Run a command by its ID from history."
#         echo "  delete <ID>               Delete a specific command by ID."
#         echo "  clear                     Clear the entire command history."
#         echo "  unique                    Show unique commands in history."
#         echo "  export <filename>         Export the history to a file."
#         echo "  import <filename>         Import history from a file."
#         echo "  stats                     Show command usage statistics."
#         echo "  interactive               Interactive search of history using fzf."
#         echo "  range <start_ID> <end_ID> Show history within a range of IDs."
#         echo "  last                      Re-run the last executed command."
#         echo "  blacklist <command>       Prevent specific commands from being saved in history."
#         echo "  favorite <ID>             Mark a command as a favorite."
#         echo "  showfavorites             Show all favorite commands."
#         echo "  backup                    Backup the current history to a timestamped file."
#         echo "  restorelast               Restore the last deleted command."
#         echo "  mostused                  Show the most frequently used commands."
#         echo "  savesession <filename>    Save the current session history to a file."
#         echo "  restoresession <filename> Restore session history from a file."
#         echo "  -h, --help                Show this help message."
#         echo
#     }

#     if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
#         show_help
#     elif [ "$#" -eq 0 ]; then
#         # No arguments, display all history.
#         builtin history
#     elif [[ "$1" =~ ^[0-9]+$ ]]; then
#         # If first argument is a number, show last n entries.
#         builtin history | tail -n "$1"
#     elif [ "$1" = "search" ] && [ "$#" -ge 2 ]; then
#         # Search command. Usage: history search <keyword>
#         shift
#         builtin history | grep -i "$*"
#     elif [ "$1" = "run" ] && [ "$#" -eq 2 ]; then
#         # Run specific command by ID. Usage: history run <ID>
#         command=$(builtin history | grep -E "^ *$2" | sed 's/^[0-9 ]*//')
#         if [ -n "$command" ]; then
#             eval "$command"
#         else
#             echo "Command ID not found in history."
#         fi
#     elif [ "$1" = "delete" ] && [ "$#" -eq 2 ]; then
#         # Delete a specific command from history by ID. Usage: history delete <ID>
#         history -d "$2"
#         echo "Entry ID $2 deleted from history."
#     elif [ "$1" = "clear" ]; then
#         # Clear the entire history.
#         builtin history -c
#         echo "History cleared."
#     elif [ "$1" = "unique" ]; then
#         # Display unique commands. Usage: history unique
#         builtin history | awk '{$1=""; print $0}' | sort | uniq
#     elif [ "$1" = "export" ] && [ "$#" -eq 2 ]; then
#         # Export history to a file. Usage: history export <filename>
#         builtin history > "$2"
#         echo "History exported to $2."
#     elif [ "$1" = "import" ] && [ "$#" -eq 2 ]; then
#         # Import history from a file. Usage: history import <filename>
#         if [ -f "$2" ]; then
#             cat "$2" | while read -r cmd; do
#                 history -s "$cmd"
#             done
#             echo "History imported from $2."
#         else
#             echo "File $2 not found."
#         fi
#     elif [ "$1" = "stats" ]; then
#         # Show command usage statistics. Usage: history stats
#         builtin history | awk '{$1=""; print $0}' | awk '{print $1}' | sort | uniq -c | sort -rn
#     elif [ "$1" = "interactive" ]; then
#         # Interactive search using fzf. Usage: history interactive
#         if command -v fzf >/dev/null 2>&1; then
#             cmd=$(builtin history | fzf | sed 's/^[0-9 ]*//')
#             if [ -n "$cmd" ]; then
#                 eval "$cmd"
#             fi
#         else
#             echo "fzf is not installed. Please install it for interactive search."
#         fi
#     elif [ "$1" = "range" ] && [ "$#" -eq 3 ]; then
#         # Show history in a specified range. Usage: history range <start_ID> <end_ID>
#         builtin history | awk -v start="$2" -v end="$3" '$1 >= start && $1 <= end'
#     elif [ "$1" = "last" ]; then
#         # Re-run the last command. Usage: history last
#         command=$(builtin history | tail -n 2 | head -n 1 | sed 's/^[0-9 ]*//')
#         if [ -n "$command" ]; then
#             eval "$command"
#         fi
#     elif [ "$1" = "blacklist" ] && [ "$#" -eq 2 ]; then
#         # Blacklist specific commands from being saved in history. Usage: history blacklist <command>
#         export HISTIGNORE="$HISTIGNORE:$2"
#         echo "Command '$2' is now blacklisted from history."
#     elif [ "$1" = "favorite" ] && [ "$#" -eq 2 ]; then
#         # Mark a command as favorite by ID. Usage: history favorite <ID>
#         command=$(builtin history | grep -E "^ *$2" | sed 's/^[0-9 ]*//')
#         if [ -n "$command" ]; then
#             echo "$command" >> "$FAVORITES_FILE"
#             echo "Command added to favorites."
#         else
#             echo "Command ID not found in history."
#         fi
#     elif [ "$1" = "showfavorites" ]; then
#         # Show all favorite commands. Usage: history showfavorites
#         if [ -f "$FAVORITES_FILE" ]; then
#             cat "$FAVORITES_FILE"
#         else
#             echo "No favorites found."
#         fi
#     elif [ "$1" = "backup" ]; then
#         # Backup history to a timestamped file. Usage: history backup
#         mkdir -p "$HIST_BACKUP_DIR"
#         backup_file="$HIST_BACKUP_DIR/history_backup_$(date +%Y%m%d_%H%M%S).txt"
#         builtin history > "$backup_file"
#         echo "History backed up to $backup_file."
#     elif [ "$1" = "restorelast" ]; then
#         # Restore the last deleted command. Usage: history restorelast
#         last_deleted=$(tail -n 1 ~/.bash_history_deleted)
#         if [ -n "$last_deleted" ]; then
#             history -s "$last_deleted"
#             echo "Restored: $last_deleted"
#         else
#             echo "No deleted command to restore."
#         fi
#     elif [ "$1" = "mostused" ]; then
#         # Show the most frequently used commands. Usage: history mostused
#         builtin history | awk '{$1=""; print $0}' | awk '{print $1}' | sort | uniq -c | sort -rn | head -10
#     elif [ "$1" = "savesession" ]; then
#         # Save current session history to a custom file. Usage: history savesession <filename>
#         history -w "$2"
#         echo "Current session history saved to $2."
#     elif [ "$1" = "restoresession" ]; then
#         # Restore session history from a custom file. Usage: history restoresession <filename>
#         if [ -f "$2" ]; then
#             history -r "$2"
#             echo "Session history restored from $2."
#         else
#             echo "File $2 not found."
#         fi
#     else
#         # Default case: if no match, pass all arguments to the builtin history command.
#         builtin history "$@"
#     fi
# }

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


function GrePFind() {
  # Search for pattern $2 in the folder $1 and its subfolders
  # usage: grepfind ~/.logs pattern
  # usage: grepfind ~/.logs "This is pattern"
  grep -rnw "$1" -e "$2"
}



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



fcount() {
    local count_type=""
    local target_path="."
    local include_hidden=false
    local help_text="Usage: fcount [-f|-d|-a] [-h] [path]
    -f      Count files only
    -d      Count directories only
    -a      Include hidden files/directories
    -h      Display this help
    path    Directory to count in (default: current directory)"
    
    # Process options
    while getopts "fdah" opt; do
        case $opt in
            f) count_type="files" ;;
            d) count_type="dirs" ;;
            a) include_hidden=true ;;
            h) echo "$help_text"; return 0 ;;
            *) echo "$help_text"; return 1 ;;
        esac
    done
    
    # Remove the options from the argument list
    shift $((OPTIND-1))
    
    # If a path is provided, use it
    if [ -n "$1" ]; then
        # Remove trailing slash if present but preserve root directory
        if [ "$1" != "/" ]; then
            target_path="${1%/}"
        else
            target_path="$1"
        fi
        
        # Check if path contains problematic characters
        if echo "$target_path" | grep -q '[[:cntrl:]]'; then
            echo "Error: Path contains control characters which cannot be safely processed"
            return 1
        fi
    fi
    
    # Error handling - check if path exists and is accessible
    if [ ! -e "$target_path" ]; then
        echo "Error: '$target_path' does not exist"
        return 1
    elif [ ! -d "$target_path" ]; then
        echo "Error: '$target_path' is not a directory"
        return 1
    elif [ ! -r "$target_path" ]; then
        echo "Error: Cannot read '$target_path' (permission denied)"
        return 1
    fi
    
    # Check if required option is specified
    if [ -z "$count_type" ]; then
        echo "Error: Please specify what to count using -f (files) or -d (directories)"
        return 1
    fi
    
    # Use NULL-terminated output to safely handle paths with spaces and special characters
    # Store current IFS to restore later
    local OLD_IFS="$IFS"
    
    # Use command to bypass aliases and perform counts in subshell to isolate cd
    (
        # Change to target directory with error handling
        if ! cd "$target_path" 2>/dev/null; then
            echo "Error: Failed to access '$target_path'"
            return 1
        fi
        
        # Count items separately with support for tricky filenames
        local file_count=0
        local dir_count=0
        local symlink_count=0
        local total_count=0
        
        # Set IFS to newline for reading output safely
        IFS=$'\n'
        
        if $include_hidden; then
            # Process all items including hidden ones
            for item in $(command ls -la); do
                # Skip the "total" line
                if echo "$item" | grep -q "^total"; then
                    continue
                fi
                
                # Process each item by first character
                first_char=$(echo "$item" | cut -c 1)
                if [ "$first_char" = "d" ]; then
                    # It's a directory
                    # Check if it's not . or ..
                    if ! echo "$item" | grep -q " \.$" && ! echo "$item" | grep -q " \.\.$"; then
                        dir_count=$((dir_count + 1))
                    fi
                elif [ "$first_char" = "l" ]; then
                    # It's a symbolic link
                    symlink_count=$((symlink_count + 1))
                elif [ "$first_char" = "-" ]; then
                    # It's a regular file
                    file_count=$((file_count + 1))
                fi
            done
        else
            # Process only non-hidden items
            for item in $(command ls -l); do
                # Skip the "total" line
                if echo "$item" | grep -q "^total"; then
                    continue
                fi
                
                # Skip hidden items
                if echo "$item" | grep -q " \.[^/]*$"; then
                    continue
                fi
                
                # Process each item by first character
                first_char=$(echo "$item" | cut -c 1)
                if [ "$first_char" = "d" ]; then
                    # It's a directory
                    dir_count=$((dir_count + 1))
                elif [ "$first_char" = "l" ]; then
                    # It's a symbolic link
                    symlink_count=$((symlink_count + 1))
                elif [ "$first_char" = "-" ]; then
                    # It's a regular file
                    file_count=$((file_count + 1))
                fi
            done
        fi
        
        # Restore original IFS
        IFS="$OLD_IFS"
        
        # Output the requested count
        if [ "$count_type" = "files" ]; then
            echo "$file_count files"
        elif [ "$count_type" = "dirs" ]; then
            echo "$dir_count dirs"
        fi
        
        # Display symbolic link count if any exist
        if [ "$symlink_count" -gt 0 ]; then
            echo "symbolic: $symlink_count"
        fi
    )
    
    # Restore IFS in the main function scope too
    IFS="$OLD_IFS"
}

count_files() {
  local dir="${1:-.}"
  if [[ -d "$dir" ]]; then
    fd --type f --max-depth 1 --hidden --exclude .DS_Store . "$dir" | wc -l
  else
    echo "Error: '$dir' is not a valid directory." >&2
    return 1
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
