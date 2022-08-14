# Environment variable
export LANG=en_US.UTF-8

# History
HISTFILE=~/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt share_history

# Color
autoload -Uz colors && colors

# Completion
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Correct
setopt correct
SPROMPT="%R -> %r? [y,n]: "

# Option
setopt ignore_eof
setopt print_eight_bit
setopt no_beep
setopt no_flow_control
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

# Alias
alias ls='ls -FG'
alias ll='ls -alFG'
alias reload='exec $SHELL -l'
alias vim="nvim"
alias vi="nvim"
alias cot='open -a /Applications/CotEditor.app'

# sheldon setup
eval "$(sheldon source)"

# Starship setup
eval "$(starship init zsh)"
