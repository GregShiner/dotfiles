#!/bin/zsh
#
# .zshenv - Zsh environment file, loaded always.
#

# NOTE: .zshenv needs to live at ~/.zshenv, not in $ZDOTDIR!
# NOTE: THIS FILE LIVES IN $ZDOTDIR AND IS SYMLINKED TO ~/.zshenv

# Set ZDOTDIR if you want to re-home Zsh.
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export ZDOTDIR=${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}

. "$HOME/.cargo/env"
export TRASH="~/.local/share/Trash/files/"
export EDITOR="/usr/bin/nvim"
