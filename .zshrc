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
alias jnb='jupyter lab'
alias python='python3'
alias pypy='pypy3'
alias pip='pip3'
alias src='source'
alias resrc='source $HOME/.zshrc'
alias randomart='$HOME/Development/github/justuswilhelm/hashprint/randomart.py'
alias mypy='mypy --strict --pretty'
alias vi=nvim
alias wezterm=/Applications/WezTerm.app/Contents/MacOS/wezterm

#other variables
#
export VISUAL=nvim
export EDITOR="$VISUAL"

export HOMEBREW_NO_ANALYTICS=1
export PYTHONBREAKPOINT=ipdb.set_trace
