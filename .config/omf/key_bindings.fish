function bind_dollar
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

bind '$' bind_dollar

# ctrl+backspace
bind \b 'backward-kill-word'
# ctrl+del
bind \e\[3\;5~ 'kill-word'
