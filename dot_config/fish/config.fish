# Disable greeting message
set -U fish_greeting

# Set PATH, MANPATH, etc., for Homebrew.
if status --is-interactive
  eval (/opt/homebrew/bin/brew shellenv)
end

set -gx ANDROID_HOME /opt/homebrew/share/android-commandlinetools
set -gx SSH_AUTH_SOCK ~/.1password/agent.sock

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

# Configure ASDF
source (brew --prefix asdf)"/libexec/asdf.fish"

# Configure zoxide
zoxide init fish | source

# Configure 1Password
op completion fish | source

if status is-interactive
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
    abbr --add --global py python
    abbr --add --global pyserver py -m http.server
    abbr --add --global pipup pip freeze --local | cut -d = -f 1  | xargs pip install -U
end

if set -q ITERM_SESSION_ID && test -e ~/.iterm2_shell_integration.fish
   source ~/.iterm2_shell_integration.fish
end
