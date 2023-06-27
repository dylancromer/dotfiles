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

autoload -Uz promptinit
promptinit
prompt nicoulaj

# Customize to your needs...

#Path
PATH="/usr/local/opt/ruby/bin:$PATH"
PATH="$PATH:$HOME/Library/Python/3.7/bin/"
PATH="$PATH:/Library/TeX/texbin/"
PATH="$PATH:$HOME/.local/bin/"
PATH="$PATH:$HOME/.cargo/bin"

#aliases
alias jnb='jupyter notebook'
alias python='python3'
alias pypy='pypy3'
alias pip='pip3'
alias src='source'
alias resrc='source $HOME/.zshrc'
alias randomart='$HOME/Development/github/justuswilhelm/hashprint/randomart.py'
alias clear='echo "Nope"'
alias mypy='mypy --strict --pretty'

#other variables
#
export VISUAL=vim
export EDITOR="$VISUAL"
