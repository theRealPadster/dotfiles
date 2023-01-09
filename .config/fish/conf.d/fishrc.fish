# Load env/export/aliases
source ~/.shell-env
# Load key bindings
# none for fish, and the syntax is incompatible
# source ~/.shell-keys
#set -Ua fish_user_paths (yarn global bin)

function last_history_item; echo $history[1]; end
abbr -a !! --position anywhere --function last_history_item

# Set up OMF Scorphish theme prompt
set -g theme_display_node yes
set -g theme_display_virtualenv no
set -g theme_display_ruby no

# Run 'nvm use' automatically every time there's
# a .nvmrc file in the directory. Also, revert to default
# version when entering a directory without .nvmrc
# https://stackoverflow.com/a/50378304
# https://stackoverflow.com/a/48157087
function nvm_prompt --on-variable PWD
    if [ "$OLD_PWD" != "$PWD" ]
        set -g OLD_PWD "$PWD"
        if [ -e .nvmrc ]
            nvm use
            set -g NVM_DIRTY true
        else if [ "$NVM_DIRTY" = true ]
            nvm use default
            set -g NVM_DIRTY false
        end
    end
end

# Set screen window name to current directory (with ssh hostname if applicable)
function prompt --on-event fish_prompt

  switch "$TERM"
  case 'screen*'

    # prepend hostname to screen(1) title only if on ssh
    if set -q SSH_CLIENT
      set maybehost (hostname):
    else
      set maybehost ""
    end

    # set HPWD="${PWD##*/}"
    set HPWD (basename $PWD)

    # TODO: (status current-command) will give the currently running command,
    # which would be nice to use instead of directory name if possible

    # inside the function fish_title(), we need to
    # force stdout to reach the terminal
    #
    # (status current-command) gives only the command name
    # echo -ne "\\ek"$maybehost(status current-command)"\\e\\" > /dev/tty
    echo -ne "\\ek"$maybehost$HPWD"\\e\\" > /dev/tty

  end
end


# switch (uname)
#     case Linux
#         exit
#     case Darwin
#         exit
#     case FreeBSD NetBSD DragonFly
#         echo Hi Beastie!
#     case '*'
#         echo Hi, potato!
# end
