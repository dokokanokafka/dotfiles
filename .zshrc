## エイリアス
alias ll='ls -l'
alias ls="gls --color=auto"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /Users/haruhikido/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source <(curl -sL git.io/zi-loader); zzinit

## コマンド補完
## zinit ice wait'0'; zinit light zsh-users/zsh-completions
## autoload -Uz compinit && compinit

## 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

## 補完候補を一覧表示したとき、Tabや矢印で選択できるようにする
zstyle ':completion:*:default' menu select=1 
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## シンタックスハイライト　タイポしているところを強調表示
zinit light zsh-users/zsh-syntax-highlighting

## 履歴補完
zinit light zsh-users/zsh-autosuggestions

## コマンド履歴検索
function peco-history-selection() {
  BUFFER=`history -n 1 | tac  | awk '!a[$0]++' | peco`
  CURSOR=$#BUFFER
  zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection #ctr +r で履歴検索




## 履歴保存管理
HISTFILE=$ZDOTDIR/.zsh-history
HISTSIZE=100000
SAVEHIST=1000000

# don't check for new mail
MAILCHECK=0

# 色を使用出来るようにする
autoload -Uz colors
colors
 
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# コマンドのスペルを訂正する
setopt correct

# 同時に起動した zsh の間でヒストリを共有する
setopt share_history