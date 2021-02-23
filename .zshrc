# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set up keybinds
typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
function zle-line-init () {
    echoti smkx
}
function zle-line-finish () {
    echoti rmkx
}

if [ -n "${DISPLAY:-}" ]; then
   zle -N zle-line-init
   zle -N zle-line-finish
fi

# Set up history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY_TIME
# INC_APPEND_HISTORY_TIME writes to history from all terminals open concurrently, but that history "will not be available immediately from other instances of the shell that are using the same history file". This makes more sense to me, because then I can traverse each terminal's history independently, but it's still all logged. – Sparhawk Sep 22 at 13:16

# Add nvm support (https://github.com/lukechilds/zsh-nvm)
source ~/.zsh-nvm/zsh-nvm.plugin.zsh
source ~/.auto-nvm.sh
# Zsh doesn't use PROMPT_COMMAND, so trigger it here
precmd() { eval "$PROMPT_COMMAND" }

# Load env/export/aliases
source ~/.shell-env
# load zsh-specific env
export PATH="$PATH:`yarn global bin`"

# Load key bindings
source ~/.shell-keys

# Load other OS-specific configs
case "$OSTYPE" in
  linux*)
    # Load theme
    export p9ktheme=/usr/share/zsh-theme-powerlevel10k/powerlevel9k.zsh-theme
    [[ ! -f $p9ktheme ]] || source $p9ktheme
    # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
    [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
  ;;
  darwin*)
    # ...
  ;;
  dragonfly*|freebsd*|netbsd*|openbsd*)
    # ...
  ;;
esac
