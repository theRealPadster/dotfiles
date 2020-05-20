# Load theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel9k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Other
alias ls='ls --color=auto'
export LIBVA_DRIVER_NAME=vdpau
export VDPAU_DRIVER=nvidia
export VISUAL="gedit"
alias update='yay -Syu'

# Keybinds

# ctrl+left
bindkey "^[[1;5D" backward-word
# ctrl+right
bindkey "^[[1;5C" forward-word
# ctrl+backspace
bindkey "^H" backward-kill-word
# ctrl+del
bindkey "^[[3;5~" kill-word
