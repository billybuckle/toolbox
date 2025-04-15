# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-autosuggestions
  zsh-history-substring-search
)

source $ZSH/oh-my-zsh.sh

# Plugin configs
source $ZSH/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Disable new user prompt
zstyle ':zsh-newuser-install:*' disable true

# Powerlevel10k config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ALIASES
alias gs="git status -s"
alias gl="git log --pretty=format:\"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]\" --decorate --date=short"
alias ga="git add"
alias gc="git commit --verbose"
alias gca="git commit --amend"
alias gcf="git commit --fixup"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gb="git for-each-ref --sort='-authordate' --format='%(authordate)%09%(objectname:short)%09%(refname)' refs/head | sed -e 's-refs/heads/--'"
alias gap="git add ** git commit --amend --no-edit && git push -f"
alias gm="git merge"
