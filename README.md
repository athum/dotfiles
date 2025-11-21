# README

## Configuring zsh
## Configuring Github
## Configuring Alacritty
Download the latest release [here](https://github.com/alacritty/alacritty/releases).

Copy over the TOML configuration file from Github, and download themes:
```
mkdir -p ~/.config/alacritty/
touch mkdir -p ~/.config/alacritty/alacritty.toml

mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/theme
```
## Configuring tmux
### Reference
#### Session Management
```
tmux new  # Starts a new session
tmux ls # Lists sessions
tmux new 'emacs ~/.tmux.conf' # Starts a new session with a command

tmux attach # Attaches to an existing session (most recently used)
tmux attach -t[session-name] # Attaches to an existing specified session 
Ctrl + b d # detach
```
#### Window and pane management
```
Ctrl + b c # Create new window
:neww -dn[window-name] # Create new window with a specific name

Ctrl + b 0 # changes to window 0, from 0-9
Ctrl + b n # goes to next window in list by number
Ctrl + b p # goes to previous window in list by number
Ctrl + b l # goes to last window

Ctrl + b % # splits current pane horizontally
Ctrl + b " splits current pane vertically

Ctrl + b [up|down|left|right] # changes to specified pane
```
#### General
```
# Help
Ctrl + b ?

# Kill server
:kill-server
```

## Configuring Golang
## Configuring VSCode

