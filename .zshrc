# zmodload zsh/zprof
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:/usr/local/lib/node_modules 
export PATH=$PATH:/usr/local/Cellar/node/20.8.0/bin
export EDITOR="hx"

# ---

# BASH HISTORY CONFIG
HISTFILE=~/.zsh_history
setopt SHARE_HISTORY # share history between sessions
setopt HIST_IGNORE_DUPS # ignore duplicate commands
setopt EXTENDED_HISTORY # save each commands ts and duration
setopt HIST_REDUCE_BLANKS # remove superfluous blanks from each command line in the history
setopt APPEND_HISTORY # append history to the file rather than overwriting it.
setopt INC_APPEND_HISTORY # write to the history file immediately after each command

# ---

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(docker-compose kube-ps1 gcloud zsh-autosuggestions zsh-syntax-highlighting git iterm2)

source "$ZSH/oh-my-zsh.sh"
source "$HOME/.dotfiles/kubectl_aliases.txt"
# source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
# PS1='$(kube_ps1)'$PS1
PROMPT='$(kube_ps1)'$PROMPT # or RPROMPT='$(kube_ps1)'


# source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
# source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
# source <(stern --completion=zsh)
# $export PATH="/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin:$PATH"
# $export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
eval "$(oh-my-posh --init --shell zsh --config ~/.dotfiles/ohmyposh_config.toml)"

source "${HOME}/.iterm2_shell_integration.zsh"

USE_GKE_GCLOUD_AUTH_PLUGIN=True

source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

export PATH="/usr/local/opt/kubernetes-cli@1.22/bin:$PATH" 

# This lazy loads nvm
nvm() {
  unset -f nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use # This loads nvm
  nvm $@
}

# speeds up compinit by running once a day
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
  touch ~/.zcompdump
else
  compinit -C
fi

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

eval "$(mcfly init zsh)"
eval "$(zoxide init zsh)"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/admin/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
export PATH="/usr/local/sbin:$PATH"

