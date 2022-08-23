# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# Created by newuser for 5.8
# source ~/.config/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# source ~/.config/powerlevel10k/config/p10k-robbyrussell.zsh # Uncomment to enable the Robbyrussel theme from Oh-my-zsh!

# Aliases for common usability.
alias ls="ls --color=auto"
# alias hx="helix"

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Add scripts to the PATH variable
export PATH=$PATH:~/scripts

# Setup for nnn to work and stay in working directory.
n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

# VI MODE SETTINGS
bindkey -v # Enable vi mode.

# Basic auto/tab complete:
autoload -U compinit && compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
                                     
# Use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Search in history functionality in vi-mode (while in instert mode).

# bindkey '^R' history-incremental-search-backward
# bindkey '^S' history-incremental-search-forward

export KEYTIMEOUT=1

# bindkey -e # Enable emacs mode.

# zstyle ':completion:*' matcher-list 'r:[[:ascii:]]||[[:ascii:]]=** r:|=* m:{a-z\-}={A-Z\_}' # Fuzzy matnching for zsh
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'
zstyle ':completion:*' list-suffixes 
zstyle ':completion:*' expand prefix suffix 

bindkey '^[[Z' reverse-menu-complete # Allow for Shift-TAB to go back in menu.
setopt no_list_ambiguous             # Correct capitalization and show completion menu.
setopt MENU_COMPLETE
# _comp_options+=(globdots)          # Includes hidden files.

# Color in tab complete.
eval "$(dircolors)"                                   # Evaluates the dircolors variable and allows for coloring.
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # Just adds the normal ls --color colors to autocomplete menu.
# zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==01=02}:${(s.:.)LS_COLORS}")' # Adds colors to the complete pattern and following character.

# Enable colors and change prompt:
autoload -U colors && colors

export FZF_DEFAULT_COMMAND="fd --hidden" # Give fzf a faster command, fd instead of find. Allowing hidden files and dirs.
export EDITOR="nvim"

# I think this is not necessary
# export TERM="xterm-kitty"

# Add user .local/bin folder to PATH
export PATH=$PATH:/home/ms45/.local/bin

eval "$(zoxide init zsh)"

# Enable suggestions
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Enable syntax highlighting
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

eval "$(starship init zsh)"
