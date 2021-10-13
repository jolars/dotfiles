# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

# goneovim
export PATH="/opt/goneovim/:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Add cargo to path
export PATH="$HOME/.cargo/bin:$PATH"

# Set default editor to
export EDITOR="vi"
export VISUAL="nvim"
export BROWSER="firefox"
