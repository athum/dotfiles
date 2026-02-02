# README

## Configuring zsh
1. Download Xcode from the App Store and `homebrew` [here](https://brew.sh/).
2. Install `oh-my-zsh` [here](https://ohmyz.sh/), and copy over the `.zshrc` configuration. 
3. Install `zsh-syntax-highlighting` [here](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md) using `homebrew`.
4. Install `fzf` [here](https://github.com/junegunn/fzf?tab=readme-ov-file#using-homebrew).

## Configuring neovim
Install `neovim` [here](https://neovim.io/doc2/install/) using `homebrew`. Copy over the configuration file. Then install `junegunn/vim-plug` [here](https://github.com/junegunn/vim-plug?tab=readme-ov-file#neovim) and run `:PlugInstall`.

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

## Configuring Golang
## Configuring VSCode
1. Download VSCode [here](https://code.visualstudio.com/)
2. Install color schem, Vim plugin, and any other language-related plugins.
3. Copy over `keybindings.json`.
4. Copy over `settings.json`.

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

These are default settings, but replaced with `Cmd + b` in my custom configuration.
```
Ctrl + b c # Create new window
:neww -dn[window-name] # Create new window with a specific name

Ctrl + b 0 # changes to window 0, from 0-9
Ctrl + b n # goes to next window in list by number
Ctrl + b p # goes to previous window in list by number
Ctrl + b l # goes to last window

Ctrl + b % # splits current pane vertically
Ctrl + b " # splits current pane horizontally

Ctrl + b [up|down|left|right] # changes to specified pane
```
#### General
```
# Help
Ctrl + b ?

# Kill server
:kill-server
```

## Configuring Obsidian
### General
Download Obsidian and enable Vim key bindings and "Show line numbers" in the "Editor" section of settings. Configure the following hotkeys:
```
Focus on tab group above: option+w
Focus on tab group below: option+s
Focus on tab group left: option+a
Focus on tab group right: option+d

Go to next tab: cmd+shift+]
Go to previous tab: cmd+shift+[

Split down: cmd+shift+s
Split right: cmd+shift+v

Insert template: cmd+shift+i

Navigate back: cmd+shift+h
Toggle left sidebar: cmd+shift+b
```

### Apearance
Download and enable the following two community plugins:
- Relative line numbers
- Style settings

Download and enable the `AnuPpuccin` [theme](https://github.com/AnubisNekhet/AnuPpuccin). Then download the [extended color schemes snippet](https://github.com/AnubisNekhet/AnuPpuccin/blob/main/snippets/extended-colorschemes.css) and move it into the `.obsidian/snippets` directory:
```
mkdir -p .obsidian/snippets
mv ~/Downloads/extended-colorschemes.css .obsidian/snippets/extended-colorschemes.css
```

Once that's done, enable the CSS snippet in the "Appearance" section of settings. Go to the "Style Settings" plugin section and import the following configuration:
```
{
  "anuppuccin-theme-settings@@anuppuccin-light-theme-accents": "ctp-accent-light-rosewater",
  "anuppuccin-theme-settings@@anp-active-line": "anp-current-line",
  "anuppuccin-theme-settings-extended@@catppuccin-theme-dark-extended": "ctp-everforest-dark",
  "anuppuccin-theme-settings-extended@@catppuccin-theme-extended": "ctp-solarized-light",
  "anuppuccin-theme-settings-extended@@anp-theme-ext-dark": true,
  "anuppuccin-theme-settings-extended@@anp-theme-ext-light": true,
  "anuppuccin-theme-settings@@anuppuccin-theme-accents": "ctp-accent-teal",
  "anuppuccin-theme-settings@@anp-header-color-toggle": true,
  "anuppuccin-theme-settings@@anp-colorful-frame": false,
  "anuppuccin-theme-settings@@anp-alt-tab-style": "anp-mini-tab-toggle",
  "anuppuccin-theme-settings@@anp-translucency-opacity": 0.3,
  "anuppuccin-theme-settings@@anp-colorful-frame-icon-toggle-dark": false,
  "anuppuccin-theme-settings@@anp-colorful-frame-icon-toggle-light": false,
  "anuppuccin-theme-settings@@anp-colorful-frame-opacity": 0.6,
  "anuppuccin-theme-settings@@anp-color-transition-toggle": true,
  "anuppuccin-theme-settings@@anp-layout-select": "anp-card-layout",
  "anuppuccin-theme-settings@@callout-title-opacity": 0.5,
  "anuppuccin-theme-settings@@anp-kanban-card-opacity": 0.5,
  "anuppuccin-theme-settings@@anp-kanban-lane-opacity": 0.5,
  "anuppuccin-theme-settings@@anp-rainbow-folder-bg-opacity": 0.5
}
```




