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
alias gcc='/opt/homebrew/bin/gcc-15'
alias g++='/opt/homebrew/bin/g++-15'

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
