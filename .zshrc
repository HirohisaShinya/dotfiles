#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export XDG_CONFIG_HOME=~/.config

# nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

if [ $SHLVL = 1 ]; then
  alias tmux="tmux -2 attach || tmux -2 new-session \; source-file ~/dotfiles/tmux/new-session"
fi

function urlencode {
  perl -MURI::Escape -e "print uri_escape('$*')"
}

alias dds="find ./ -name .DS_Store -print -exec rm {} ';'"
