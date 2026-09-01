# ---------------------------------------------------------
# Basic environment
# ---------------------------------------------------------

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export EDITOR="${EDITOR:-vim}"
export VISUAL="${VISUAL:-$EDITOR}"

export LANG="${LANG:-en_GB.UTF-8}"
export LC_ALL="${LC_ALL:-en_GB.UTF-8}"


# ---------------------------------------------------------
# History
# ---------------------------------------------------------

HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"

HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY


# ---------------------------------------------------------
# Completion
# ---------------------------------------------------------

autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'


# ---------------------------------------------------------
# General Zsh behaviour
# ---------------------------------------------------------

setopt AUTO_CD
setopt INTERACTIVE_COMMENTS

bindkey -e


# ---------------------------------------------------------
# History navigation
# ---------------------------------------------------------

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search


# ---------------------------------------------------------
# Useful aliases
# ---------------------------------------------------------

alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias c='clear'

alias gs='git status'
alias gd='git diff'
alias gl='git log --oneline --decorate --graph'

# ---------------------------------------------------------
# pnpm
# ---------------------------------------------------------

export PNPM_HOME="$HOME/.local/share/pnpm"

if [[ -d "$PNPM_HOME" ]]; then
    export PATH="$PNPM_HOME/bin:$PNPM_HOME:$PATH"
fi


# ---------------------------------------------------------
# Zsh plugins
# ---------------------------------------------------------

source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"

source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"


# ---------------------------------------------------------
# Powerlevel10k
# ---------------------------------------------------------

typeset -g POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

source "$HOME/.zsh/powerlevel10k/powerlevel10k.zsh-theme"

[[ ! -f "$HOME/.p10k.zsh" ]] || source "$HOME/.p10k.zsh"