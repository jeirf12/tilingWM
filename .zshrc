# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#Colores aplicables
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
grayColour="\e[0;37m\033[1m"

#EDITOR
export EDITOR="/bin/nvim"

# NPM packages in homedir
export NPM_PACKAGES="$HOME/.npm-packages"

# Tell our environment about user-installed node tools
export PATH="$NPM_PACKAGES/bin:$PATH"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH
# delete if you already modified MANPATH elsewhere in your configuration export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# Tell Node about these packages
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt histignorealldups sharehistory

autoload -Uz compinit
compinit

autoload -Uz promptinit
promptinit

#------------------------------
# Alias stuff
#------------------------------
alias cat='/bin/bat'
alias catn='/bin/cat'
alias catnl='/bin/bat --paging=never'
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'
alias lt='ls --tree'
alias nv='/bin/nvim'

#-------------------------------
# Settings AutoComplete
#-------------------------------
zstyle ':autocomplete:*' insert-unambiguous yes
zstyle ':autocomplete:*' widget-style menu-select
zstyle ':autocomplete:*' min-input 2
zstyle ':autocomplete:*' add-space \
    executables aliases functions builtins reserved-words commands

#-------------------------------
# Plugins
#-------------------------------
source /usr/share/zsh-plugins/sudo.plugins.zsh
source /usr/share/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

#-------------------------------
# Functions
#-------------------------------
function uploadGit(){
  /home/fallen/.config/qtile/scriptsBash/uploadGit.sh $@
}

function initGit(){
  /home/fallen/.config/qtile/scriptsBash/initGit.sh $@
}

source ~/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
