# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

# source antidote
source ${ZDOTDIR:-~}/.antidote/antidote.zsh

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

# Aliases
alias la="ls -la"
alias restart="shutdown -r now"
alias update="sudo pacman -Sy archlinux-keyring && sudo pacman -Su"
alias psussh="ssh grs5424@lxcluster.tlt.psu.edu"
alias typeclip="xclip -selection clipboard -out | xdotool selectwindow windowfocus type --clearmodifiers --delay 25 --window %@ --file -"
alias tmuxs="~/.config/tmux/scripts/tmux-sessionizer.sh"
alias vpnup="sudo wg-quick up wg0"
alias vpndown="sudo wg-quick down wg0"
alias yadml="lazygit -ucd .local/share/yadm/lazygit -w ~ -g .local/share/yadm/repo.git"
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
alias -g zshrc=$ZDOTDIR/.zshrc
alias -g zshconf=$ZDOTDIR
alias -g initlua=~/.config/nvim/init.lua
alias -g nvimconf=~/.config/nvim/
alias -g tmuxconf=~/.config/tmux/tmux.conf
# Neat lil trash command
function trash {
    mv "$1" trash
}

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh

# Get opam environment
eval $(opam env)

# Start zoxide
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"
