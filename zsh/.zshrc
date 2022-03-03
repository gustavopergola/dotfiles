if [ -f /etc/profile ]; then
	. /etc/profile
fi

if [ -f ~/.profile ]; then
	. ~/.profile
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# === HISTORY CONFIG ===
HISTFILE=~/.zsh_history
HISTZIE=10000
SAVEHIST=10000
setopt appendhistory
setopt share_history
setopt inc_append_history

# === ALIASES ===
alias cdex="code . && exit"
alias rs="rails s -b 0.0.0.0"
alias rc="rails c"
alias g="git"
alias rsdbg="rdebug-ide --host 0.0.0.0 --port 1234 --dispatcher-port 26162 -- ./bin/rails s -b 0.0.0.0"
alias open="xdg-open"
alias doco="docker-compose"
alias l="ls -lah"
alias v="lvim"

alias t="tmux"
alias tks="t kill-session -t"
alias tksa="t kill-server"
alias tn="t new -s"

alias dotf="cd ~/www/dotfiles"

alias ra="cd ~/www/respondeai/respondeai"
alias cont="cd ~/www/respondeai/content"
alias seo="cd ~/www/respondeai/seo"
alias seof="cd ~/www/respondeai/front-seo"
alias raw="cd ~/www/respondeai/web"

# === ASDF ===
[ -d ~/.asdf ] && . $HOME/.asdf/asdf.sh

export PATH="/home/brubs/.local/bin:$PATH"

export JAVA_HOME=/usr/lib/jvm/default
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# === POWERLEVEL10K THEME ===
[ -d ~/powerlevel10k ] && source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# === AUTOCOMPLETE DIRECTORIES ===
setopt auto_cd
autoload -Uz compinit
compinit
zstyle ':completion:*' menu yes select
WORDCHARS=

# === NAVIGATION ===
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/brubs/google-cloud-sdk/path.zsh.inc' ]; then . '/home/brubs/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/brubs/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/brubs/google-cloud-sdk/completion.zsh.inc'; fi

[ -f "/home/brubs/.ghcup/env" ] && source "/home/brubs/.ghcup/env" # ghcup-env