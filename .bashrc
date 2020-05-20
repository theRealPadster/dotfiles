#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

export EDITOR="vim"
alias vi='vim'
alias online='ping 8.8.8.8'
alias ip="ifconfig | grep -Eo '([0-9]+\.){3}([0-9]+.)' | grep -Ev '255\$|(127.0.0.1)|(255.255.255.0)'"
export SPICETIFY_CONFIG="$HOME/.config/spicetify"
export PATH="$PATH:/usr/local/bin"

## Add nvm support
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source ~/.auto-nvm.sh

# Load OS-specific configs
case "$OSTYPE" in
  darwin*)
    # ...
    source ~/.bashrc-mac.bashrc
  ;;
  linux*)
    # ...
    source ~/.bashrc-linux.bashrc
  ;;
  dragonfly*|freebsd*|netbsd*|openbsd*)
    # ...
  ;;
esac
