################
# Shell config #
################

#Neofetch
if [ "$TERM_PROGRAM" != tmux ]; then
  neofetch --ascii --source ~/.config/neofetch/ascii.txt
fi

#Powerlevel10k
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
 source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# to customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/.p10k.zsh ]] || source ~/.config/.p10k.zsh

#ZSH plugins
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS (Homebrew paths)
  source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
  # Linux (Cloned into ~/.config/zsh)
  [[ -f ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme ]] && source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme
  [[ -f ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
  [[ -f ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

#ZSH history
HISTFILE=$HOME/.zhistory
SAVEHIST=10000
HISTSIZE=9999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify
# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

#FZF
eval "$(fzf --zsh)"
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
# Unbind default Ctrl-T
bindkey -r '^T'
# Bind Ctrl-F to the fzf file widget
bindkey '^F' fzf-file-widget

#Aliases
alias dotfiles="git --git-dir=$DOTFILES --work-tree=$HOME"
alias ls="ls --color"
alias g++="g++ --std=c++17"
if [[ "$OSTYPE" == "darwin"* ]]; then
  alias rm="trash"
  alias remove="command rm"
fi

##########################
# Dev environment config #
##########################

# NVM
# export NVM_DIR="$HOME/.nvm"
#   [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
#   [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Pyenv
# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init --path)"
# eval "$(pyenv virtualenv-init -)"

# Go
# export PATH="$PATH:$(go env GOPATH)/bin"

# Rust
# source "$HOME/.cargo/env"

# Generated for envman. Do not edit.
# [ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
