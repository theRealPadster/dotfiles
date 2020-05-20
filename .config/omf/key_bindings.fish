function bind_bang
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function bind_dollar
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

bind ! bind_bang
bind '$' bind_dollar

# ctrl+backspace
bind \b 'backward-kill-word'
# ctrl+del
bind \e\[3\;5~ 'kill-word'
# ctrl+r
bind \cr 'peco_select_history (commandline -b)'