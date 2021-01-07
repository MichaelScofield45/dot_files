# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by newuser for 5.8
source ~/.config/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# source ~/.config/p10k-robbyrussell.zsh # Uncomment to enable the Robbyrussel them from Oh-my-zsh!

# Aliases for common usability.
alias ls="ls --color"

# Setup for nnn to work and stay in working directory.
n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

bindkey -v # Enable vi mode.
export KEYTIMEOUT=1

# Basic auto/tab complete:
autoload -U compinit && compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
 
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 
                                     # Make zsh completion case insensitive.
                                     
zstyle ':completion:*' list-suffixes zstyle ':completion:*' expand prefix suffix 


bindkey '^[[Z' reverse-menu-complete # Allow for Shift-TAB to go back in menu.
setopt no_list_ambiguous             # Correct capitalization and show completion menu.
setopt MENU_COMPLETE
# _comp_options+=(globdots)          # Includes hidden files.

# Color in tab complete.
eval "$(dircolors)"                                   # Evaluates the dircolors variable and allows for coloring.
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # Just adds the normal ls --color colors to autocomplete menu.
#zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==01=02}:${(s.:.)LS_COLORS}")' # Adds colors to the complete pattern and following character.


# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Enable colors and change prompt:
autoload -U colors && colors

export FZF_DEFAULT_COMMAND="fd --hidden" # Give fzf a faster command, fd instead of find. Allowing hidden files and dirs.
