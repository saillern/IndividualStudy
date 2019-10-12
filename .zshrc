# Finished adapting your MANPATH environment variable for use with MacPorts.  
export LANG=ja_JP.UTF-8
HISTFILE=$HOME/.zsh-history
HISTSIZE=1000000
SAVEHIST=1000000
# Path to your oh-my-zsh installation.
export ZSH="/Users/saillern/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

PROMPT="%F{087}>>%f"

#Colors
autoload -Uz colors
colors
# ssh
 export SSH_KEY_PATH="~/.ssh/rsa_id*" 
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

#alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias ls="ls -G"
alias la="ls -a" alias ll="ls -lh"
alias vi="nvim"
alias vim="nvim" 
alias vz="vim ~/.zshrc"
alias sz="source ~/.zshrc"
alias vt="vim ~/.tmux.conf"

# zplug settings

export ZPLUG_PATH="/Users/saillern/.zplug"
source $ZPLUG_PATH/init.zsh
# Then, source plugins and add commands to $PATH

# zplugが無ければgitからclone
if [[ ! -d ~/.zplug ]];then
  git clone https://github.com/zplug/zplug ~/.zplug
fi

#Nodebrew PATH
export PATH=/usr/local/var/nodebrew/current/bin:$PATH

# ここに使いたいプラグインを書いておく
# zplug "ユーザー名/リポジトリ名", タグ

# 構文のハイライト(https://github.com/zsh-users/zsh-syntax-highlighting)
zplug "zsh-users/zsh-syntax-highlighting", defer:2
# history関係
zplug "zsh-users/zsh-history-substring-search" 
#補完
zplug "zsh-users/zsh-completions"
# タイプ補完
zplug "zsh-users/zsh-autosuggestions"
# oh-my-zsh をサービスと見なして、
# そこからインストールする
zplug "plugins/git",   from:oh-my-zsh
# 必要ならばアーキテクチャ指定
zplug "peco/peco"
zplug "mollifier/anyframe"
# ローカルプラグインも読み込める
zplug "~/.zsh", from:local
# 自分自身をプラグインとして管理
zplug "zplug/zplug", hook-build:'zplug --self-manage'
# インストールしてないプラグインはインストール
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
# コマンドをリンクして、PATH に追加し、プラグインは読み込む
zplug load 
