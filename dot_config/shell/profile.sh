#!/usr/bin/env sh
# @file Shared Profile
# @brief Main shell profile that is used to combine the shared profile configurations that are used by both the `~/.bashrc` and `~/.zshrc` files
# @description
#     This script is included by `~/.bashrc` and `~/.zshrc` to include imports and settings that are common to both the Bash
#     and ZSH shells.

# shellcheck disable=SC1090,SC1091,SC2016

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
[ ! -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliases.sh" ] || . "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliases.sh"


### Directory Colors
if [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/lscolors.sh" ]; then
  . "${XDG_CONFIG_HOME:-$HOME/.config}/shell/lscolors.sh"
fi

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

export ANDROID_HOME="/opt/homebrew/share/android-commandlinetools"
export FLUTTER_ROOT=$(mise where flutter)

# Configure ANDROID common paths
export PATH="$ANDROID_HOME/tools:$PATH"
export PATH="$ANDROID_HOME/tools/bin:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"
export PATH="$ANDROID_HOME/emulator:$PATH"

# Dart
export PATH="$HOME/.pub-cache/bin:$PATH"

# Configure PNPM
export PNPM_HOME="/Users/azlekov/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

export SSH_AUTH_SOCK=~/.1password/agent.sock

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8