export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL=

# alias
alias ls='lsd'
#alias grep='grep --color=auto'
alias history='history 1'
alias gcc='/opt/homebrew/bin/gcc-15'
alias g++='/opt/homebrew/bin/g++-15'

autoload -U compinit
compinit

eval "$(starship init zsh)"

export GPG_TTY=$(tty)
