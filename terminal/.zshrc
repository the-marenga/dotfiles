# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# source antidote
source ${ZDOTDIR:-~}/.antidote/antidote.zsh

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

#autoload -Uz promtinit && promtinit && promt pure
autoload -Uz promptinit && promptinit && prompt powerlevel10k

source ~/.zsh_plugins.zsh

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Speed up pasting into the terminal
DISABLE_MAGIC_FUNCTIONS="true"
# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# User configuration

# Preferred editor
export EDITOR='nvim'

# Correctly enable homebrew installed things
if [[ "$(uname)" == "Darwin" ]]; then
    path+=("/Library/Frameworks/Mono.framework/Versions/current/bin")
    path+=("/opt/homebrew/opt/binutils/bin")
    path+=("$HOME/.dotnet/tools")
    path+=("/opt/homebrew/opt/libxml2/bin")
    export PKG_CONFIG_PATH="/opt/homebrew/opt/libxml2/lib/pkgconfig:$PKG_CONFIG_PATH"
    export LIBRARY_PATH="/opt/homebrew/opt/libxml2/lib:$LIBRARY_PATH"
    export LIBXML2="/opt/homebrew/opt/libxml2/lib/libxml2.dylib"
    export PATH="/Users/marenga/.local/bin:$PATH"
fi

path+=("$HOME/.local/bin")
path+=("$HOME/.cargo/bin")

alias c="clear"
alias ls="eza -g"
alias ll="ls -l"
alias la="ls -la"
alias neofetch="fastfetch"
alias tm="tmux new-session -A -s main"

# Wake up machines in my local network
alias wakesushi="wakeonlan 00:25:90:f2:2e:66"
alias wakegummy="wakeonlan 30:9C:23:83:4F:B3"

# https://spencer.wtf/2026/02/20/cleaning-up-merged-git-branches-a-one-liner-from-the-cias-leaked-dev-docs.html
alias ciaclean='git branch --merged origin/main | grep -vE "^\s*(\*|main|develop)" | xargs -n 1 git branch -d'

