# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# The following lines were added by compinstall
zstyle :compinstall filename '/home/marenga/.zshrc'

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# User configuration

# Preferred editor
export EDITOR='nvim'

# Correctly enable homebrew installed things
if [[ "$(uname)" == "Darwin" ]]; then
    export PATH="/Library/Frameworks/Mono.framework/Versions/current/bin:$PATH"
    export PATH="/opt/homebrew/opt/binutils/bin:$PATH"
    export PATH="/opt/homebrew/opt/libxml2/bin:$PATH"
    export LIBXML2=/opt/homebrew/opt/libxml2/lib/pkgconfig/libxml-2.0.pc
fi

alias c="clear"
alias ls="eza -g"
alias neofetch="fastfetch"
alias ll="ls -l"
alias la="ls -la"
alias lt="eza -T -L 2 -l"

# Wake up machines in my local network
alias wakesushi="wakeonlan 00:25:90:f2:2e:66"
alias wakegummy="wakeonlan 30:9C:23:83:4F:B3"
