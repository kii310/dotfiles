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


# 補完
# autoload -U compinit
# compinit
autoload -Uz compinit && compinit -u
zmodload -i zsh/complist

# NOTE
# zstyle の設定を初期化する方法: zstyle -d
# zstyle の有効な設定を確認する方法: zstyle -L
# zle のウィジェットを一覧表示する方法: zle -al
## 更新手順
# 1. vim ~/.zshrc
# 2. zstyle -d
# 3. source ~/.zshrc
# 4. zstyle -L

## completer
zstyle ':completion:*' completer _complete _ignored
# zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history _ignored

## 選択可能（<C-n>, <C-p>, <C-b>, <C-f> で移動）
# zstyle ':completion:*' menu select
zstyle ':completion:*' menu true select
zstyle ':completion:*' list-prompt '%M matches'
## なぜか効かない
# zstyle ':completion:*' select-prompt '%M matches'

## 候補を詳細表示（色付けが効かない）
# zstyle ':completion:*' file-list all

## 重複削除
zstyle ':completion:*' remove-all-dups yes

## 詳細表示
zstyle ':completion:*' verbose yes

## history
### alt + n/p で履歴から補完
bindkey '^[n' history-beginning-search-backward
bindkey '^[p' history-beginning-search-forward

## 色付け
### list-colors 種別
# - no 標準色
# - fi 通常ファイル
# - di ディレクトリ
# - ex 実行ファイル
# - ln シンボリックリンクファイル
# - pi パイプ（FIFO）ファイル
# - so ソケットファイル
# - bd ブロックデバイス
# - cd キャラクタデバイス
# - tc ファイル種別を示す記号
# - sp 候補単語間の空白
# - =<pattern> <pattern>にマッチする候補
zstyle ':completion:*' list-colors di=$'{\e[36;1' ex=33
# zstyle ':completion:*:default' list-colors di=$'{\e[36;1' ex=33

# setopt auto_param_slash      # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
# setopt mark_dirs             # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
# setopt list_types            # 補完候補一覧でファイルの種別を識別マーク表示 (訳注:ls -F の記号)
# setopt auto_menu             # 補完キー連打で順に補完候補を自動で補完
# setopt auto_param_keys       # カッコの対応などを自動的に補完
# setopt interactive_comments  # コマンドラインでも # 以降をコメントと見なす
# setopt magic_equal_subst     # コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる

# setopt complete_in_word      # 語の途中でもカーソル位置で補完
# setopt always_last_prompt    # カーソル位置は保持したままファイル名一覧を順次その場で表示

# setopt print_eight_bit       # 日本語ファイル名等8ビットを通す
# setopt extended_glob         # 拡張グロブで補完(~とか^とか。例えばless *.txt~memo.txt ならmemo.txt 以外の *.txt にマッチ)
# setopt globdots              # 明確なドットの指定なしで.から始まるファイルをマッチ


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
