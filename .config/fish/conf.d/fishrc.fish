set -gx EDITOR "vim"
alias ip "ifconfig | grep -Eo '([0-9]+\.){3}([0-9]+.)' | grep -Ev '255\$|(127.0.0.1)|(255.255.255.0)'"
alias online 'ping 8.8.8.8'
set -gx SPICETIFY_CONFIG "$HOME/.config/spicetify"
set -gx PATH "$PATH:/usr/local/bin"

# Set up OMF Scorphish theme prompt
set -g theme_display_node yes
set -g theme_display_virtualenv no
set -g theme_display_ruby no

# Run 'nvm use' automatically every time there's
# a .nvmrc file in the directory. Also, revert to default
# version when entering a directory without .nvmrc
# https://stackoverflow.com/a/50378304
# https://stackoverflow.com/a/48157087
#
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

switch (uname)
    case Linux
        alias update 'yay -Syu'
        set -gx VISUAL "gedit"
    case Darwin
        alias update 'brew update'
        # shopify-app-cli
        source ~/.shopify-app-cli/shopify.fish
    case FreeBSD NetBSD DragonFly
        echo Hi Beastie!
    case '*'
        echo Hi, stranger!
end
