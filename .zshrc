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

# Customize to your needs...

#Path
PATH="$PATH:/Library/TeX/texbin/"

#aliases
alias set-szar-env='source $HOME/Development/tsz_18/szar/szar-env/bin/activate'

alias jnb='jupyter notebook'

alias resource='source $HOME/.zshrc'

alias python='python3'

alias src='source'

#other variables
#
export VISUAL=vim
export EDITOR="$VISUAL"
