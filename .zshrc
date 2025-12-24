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
alias grep='grep --color=auto'
alias gcc='/opt/homebrew/bin/gcc-15'
alias g++='/opt/homebrew/bin/g++-15'

# gnu commands
## install
# brew install coreutils \
#              diffutils \
#              findutils \
#              binutils \
#              moreutils \
#              gawk \
#              gnu-sed \
#              gnu-tar \
#              grep \
#              gzip \
#              gnu-time \
#              gnu-getopt \
#              ed
## coreutils
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/opt/homebrew/opt/coreutils/libexec/gnuman:$MANPATH"
## findutils
export PATH="/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
export MANPATH="/opt/homebrew/opt/findutils/libexec/gnuman:$MANPATH"
## binutils
export PATH="/opt/homebrew/opt/binutils/bin:$PATH"
export MANPATH="/opt/homebrew/opt/binutils/share/man:$MANPATH"
export LDFLAGS="-L/opt/homebrew/opt/binutils/lib"
export CPPFLAGS="-I/opt/homebrew/opt/binutils/include"
## awk
export PATH="/opt/homebrew/opt/gawk/libexec/gnubin:$PATH"
export MANPATH="/opt/homebrew/opt/gawk/libexec/gnuman:$MANPATH"
## sed
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export MANPATH="/opt/homebrew/opt/gnu-sed/libexec/gnuman:$MANPATH"
## tar
export PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"
export MANPATH="/opt/homebrew/opt/gnu-tar/libexec/gnuman:$MANPATH"
## grep
export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
export MANPATH="/opt/homebrew/opt/grep/libexec/gnuman:$MANPATH"
## time
export PATH="/opt/homebrew/opt/gnu-time/libexec/gnubin:$PATH"
export MANPATH="/opt/homebrew/opt/gnu-time/libexec/gnuman:$MANPATH"
## getopt
export PATH="/opt/homebrew/opt/gnu-getopt/bin:$PATH"
export MANPATH="/opt/homebrew/opt/gnu-getopt/share/man:$MANPATH"
## ed
export PATH="/opt/homebrew/opt/ed/libexec/gnubin:$PATH"
export MANPATH="/opt/homebrew/opt/ed/libexec/gnuman:$MANPATH"
## PATH の重複整理
typeset -U path
typeset -U manpath

# autoload -U compinit
# compinit
autoload -Uz compinit && compinit -u
zstyle ':completion:*' menu select

# history
export HISTSIZE=100000
export SAVEHIST=100000
# 補完時にヒストリを自動的に展開
# setopt hist_expand
# 履歴をインクリメンタルに追加
#csetopt inc_append_history
alias history='history -i 1'

# starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/dotfiles/starship.toml

export GPG_TTY=$(tty)

source ~/.safe-chain/scripts/init-posix.sh # Safe-chain Zsh initialization script
