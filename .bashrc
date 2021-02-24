#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

## Add nvm support
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source ~/.auto-nvm.sh

# Load env/export/aliases
source ~/.shell-env
# load bash-specific env
#export PATH="$PATH:`yarn global bin`"

# Load key bindings (no special keybinds for bash)
source ~/.shell-keys


# trap 'echo -ne "\033]0;$BASH_COMMAND\007"' DEBUG
# function show_name(){
#     if [[ -n "$BASH_COMMAND" ]];
#     then
#     echo -en "\033]0;`pwd`\007";
#     else
#     echo -en "\033]0;$BASH_COMMAND\007";
#     fi
# }
# export PROMPT_COMMAND='show_name'


if [[ "$TERM" == screen* ]]; then
  screen_set_window_title () {
    # if [[ -n "$BASH_COMMAND" ]];
    # then
    # local HPWD="$BASH_COMMAND"
    # else
    local HPWD="${PWD##*/}"
    # fi
    # case $HPWD in
    #   $HOME) HPWD="~";;
    #   $HOME/*) HPWD="~${HPWD#$HOME}";;
    # esac
    printf '\ek%s\e\\' "$HPWD"
  }
  PROMPT_COMMAND="screen_set_window_title; $PROMPT_COMMAND"
fi
