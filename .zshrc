# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=2000
setopt autocd extendedglob
setopt share_history
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/greg/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
autoload -Uz promptinit
promptinit
prompt redhat

# Aliases
alias la="ls -la"
alias restart="shutdown -r now"
alias update="sudo pacman -Sy archlinux-keyring && sudo pacman -Su"
alias psussh="ssh grs5424@lxcluster.tlt.psu.edu"
alias typeclip="xclip -selection clipboard -out | xdotool selectwindow windowfocus type --clearmodifiers --delay 25 --window %@ --file -"
# PATH
export PATH=$PATH:/home/greg/.local/bin
# Azure function core tools
export PATH=$PATH:/home/greg/azure-functions-cli

# Format string for the zsh time command
export TIMEFMT=$'\n================\nCPU\t%P\nuser\t%*U\nsystem\t%*S\ntotal\t%*E'

# Fix java so that GUIs are displayed properly
# https://wiki.archlinux.org/title/java#Gray_window,_applications_not_resizing_with_WM,_menus_immediately_closing
export _JAVA_AWT_WM_NONREPARENTING=1

eval $(thefuck --alias)

alias -g trash=~/.local/share/Trash/files/
alias -g zshrc=~/.zshrc
alias -g initlua=~/.config/nvim/init.lua
alias -g nvimconf=~/.config/nvim/
# Neat lil trash command
function trash {
    mv "$1" trash
}

