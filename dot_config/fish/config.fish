# Disable greeting message
set -U fish_greeting

# Set PATH, MANPATH, etc., for Homebrew.
if status --is-interactive
  eval (/opt/homebrew/bin/brew shellenv)
end

if type brew >/dev/null 2>&1
    set -x PATH (brew --prefix)/opt/coreutils/libexec/gnubin $PATH
end

set -gx ANDROID_HOME /opt/homebrew/share/android-commandlinetools
set -x FLUTTER_ROOT (mise where flutter)

set -gx SSH_AUTH_SOCK ~/.1password/agent.sock

# Set Android common paths
set -gx PATH $ANDROID_HOME/tools $PATH
set -gx PATH $ANDROID_HOME/tools/bin $PATH
set -gx PATH $ANDROID_HOME/platform-tools $PATH
set -gx PATH $ANDROID_HOME/emulator $PATH

# Dart
set -gx PATH $HOME/.pub-cache/bin $PATH

set -gx PATH $PATH /Users/azlekov/.local/bin

set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8

# Preferred editor for local and remote sessions
if test -n "$SSH_CONNECTION"
  set -gx EDITOR "vim"
else
  set -gx EDITOR "code"
end

set -gx VISUAL "code"

# Configure PNPM
set -gx PNPM_HOME "/Users/azlekov/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH

# Configure Homebrew completions
if test -d (brew --prefix)"/share/fish/completions"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/completions
end

if test -d (brew --prefix)"/share/fish/vendor_completions.d"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end

set -U fish_user_paths /usr/local/bin $fish_user_paths 



# Configure mise
if status is-interactive
  mise activate fish | source
else
  mise activate fish --shims | source
end

# Configure zoxide
zoxide init fish --cmd cd | source

# Configure 1Password
op completion fish | source

if status is-interactive
    alias py "python"
    
    alias preview "fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
    alias cat "bat --paging=never"

    abbr --add --global work cd ~/Workspace
    abbr --add --global dodi cd ~/Workspace/dodi

    # Administer like a sir
    abbr --add --global please sudo

    abbr --add --global 1plogin op signin my.1password.com {{ .email | quote }}
    abbr --add --global speedtest networkQuality

    abbr --add --global badge tput bel
    abbr --add --global stfu osascript -e 'set volume output muted true'
    abbr --add --global pumpitup osascript -e 'set volume output volume 75'
    abbr --add --global afk /System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend

    # Janitor goodies
    abbr --add --global gradleclean rm -rf $HOME/.gradle/caches/
    abbr --add --global pyclean find . | grep -E '(__pycache__|\.pyc|\.pyo$)' | xargs rm -rf

    # Python
    abbr --add --global pyserver py -m http.server
end

if set -q ITERM_SESSION_ID && test -e ~/.iterm2_shell_integration.fish
   source ~/.iterm2_shell_integration.fish
end


# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true

# Directory Colors
set config_path "$XDG_CONFIG_HOME"
if test -z "$config_path"
    set config_path "$HOME/.config"
end

set script_path "$config_path/shell/lscolors.csh"
if test -f "$script_path"
    source $script_path
end

set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,argcomplete' # optional
# mkdir -p ~/.config/fish/completions
# carapace --list | awk '{print $1}' | xargs -I{} touch ~/.config/fish/completions/{}.fish # disable auto-loaded completions (#185)
carapace _carapace | source

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/azlekov/.lmstudio/bin

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.fish 2>/dev/null || :
