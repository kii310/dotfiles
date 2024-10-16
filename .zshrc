# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

### End of Zinit's installer chunk
#source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# p10klevel

eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

alias date='gdate'
alias sed='gsed'
alias awk='gawk'
alias ls='gls --color=auto'
# alias ls='exa'
alias ls='lsd'
alias grep='grep --color=auto'
alias history='history 1'
alias bonsai='bash ~/cmd/bonsai.sh'
alias od='god'
alias ts-node='./node_modules/.bin/ts-node'
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# コマンド履歴の管理
HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=100000

# シンタックスハイライト
zinit light zsh-users/zsh-syntax-highlighting
# 入力補完
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions


# installed binutils to use greadelf
export PATH="/opt/homebrew/opt/binutils/bin:$PATH"
alias readelf='greadelf'


#pecoでhistory検索
function peco-select-history() {
  BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# go college
# export MYSQL_USER=root \
#     MYSQL_PASSWORD=go-college \
#     MYSQL_HOST=127.0.0.1 \
#     MYSQL_PORT=3306 \
#     MYSQL_DATABASE=go_college_api
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home
PATH=/Users/kiichi.satou/.volta/bin:/opt/homebrew/opt/binutils/bin:/Users/kiichi.satou/.pyenv/shims:/Users/kiichi.satou/.pyenv/bin:/opt/homebrew/opt/openjdk/bin:/Users/kiichi.satou/.volta/bin:/opt/homebrew/opt/binutils/bin:/Users/kiichi.satou/.local/share/zinit/polaris/bin:/Users/kiichi.satou/.pyenv/bin:/opt/homebrew/opt/openjdk/bin:/Users/kiichi.satou/.nvm/versions/node/v16.14.2/bin:/Library/Frameworks/Python.framework/Versions/3.10/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:/opt/X11/bin:/Users/kiichi.satou/go/bin:/Users/kiichi.satou/go/bin:/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home/bin

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
