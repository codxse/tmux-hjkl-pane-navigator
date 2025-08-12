# The `is_vim` check is crucial for passing keys to Neovim.
# This variable checks if the current pane is running Neovim.
is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"

# Bind a specific key to a command. The `-n` flag makes it non-prefixed.
# If the pane is running Neovim, send the keypress to it.
# Otherwise, switch to the adjacent pane.
bind-key -n C-h if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
bind-key -n C-j if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
bind-key -n C-k if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
bind-key -n C-l if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'
bind-key -n C-\ if-shell "$is_vim" 'send-keys C-\\' 'select-pane -l'

# You can add more comments or options here.
# For example, to enable saving on switch:
# set -g @tmux_navigator_save_on_switch 'on'

