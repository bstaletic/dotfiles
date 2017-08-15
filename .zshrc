HISTFILE=~/.zsh_history
HISTSIZE=500
SAVEHIST=500
setopt appendhistory autocd extendedglob
bindkey -v
# Disable .4 sec lag when switching modes
export KEYTIMEOUT=1
export PATH="/home/bstaletic/bin:${PATH}"
# The following lines were added by compinstall
## Completions
# do not complete backup executables
zstyle ':completion:*:complete:-command-::commands' ignored-patterns '(aptitude-*|*\~)'
# 1 correction per 3 characters at maximum
zstyle ':completion:*:approximate:'    max-errors 'reply=( $((($#PREFIX+$#SUFFIX)/3 )) numeric )'
# Completion format
zstyle ':completion:*:descriptions'    format $'%{\e[0;31m%}completing %B%d%b%{\e[0m%}'
# insert all expansions for expand completer
zstyle ':completion:*:expand:*'        tag-order all-expansions
zstyle ':completion:*:history-words'   list false
# ignore duplicate entries
zstyle ':completion:*:history-words'   remove-all-dups yes
zstyle ':completion:*:history-words'   stop yes
# match uppercase from lowercase
zstyle ':completion:*'                 matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=**'
# separate matches into groups
zstyle ':completion:*:matches'         group 'yes'
zstyle ':completion:*'                 group-name ''
# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
# recent (as of Dec 2007) zsh versions are able to provide descriptions
# for commands (read: 1st word in the line) that it will list for the user
# to choose from. The following disables that, because it's not exactly fast.
zstyle ':completion:*:-command-:*:'    verbose false
# set format for warnings
zstyle ':completion:*:warnings'        format $'%{\e[0;31m%}No matches for:%{\e[0m%} %d'
# Ignore completion functions for commands you don't have:
zstyle ':completion::(^approximate*):*:functions' ignored-patterns '_*'
# Provide more processes in completion of programs like killall:
zstyle ':completion:*:processes-names' command 'ps c -u ${USER} -o command | uniq'
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' menu select
autoload -Uz compinit
compinit
### Extensions ###
# Syntax
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/zsh-history-substring-search/zsh-history-substring-search.zsh
### zsh options
# history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_find_no_dups
setopt share_history
setopt extended_history
# misc
setopt correct
### Aliases
alias -g mkdir="mkdir -v -p"
alias -g ls="ls --color=always --group-directories-first -N"
alias la="ls -A"
alias ll="ls -lA"
alias -g mv="mv -i"
alias -g rm="rm -I"
alias -g cp="cp -i"
alias -g ...="../.."
alias -g ....="../../.."
# Vi mode indicator
function zle-line-init zle-keymap-select {
	RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
	RPS2=$RPS1
	zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
# Substring search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# Load zsh's mv and args
autoload -Uz zargs
autoload -Uz zmv
alias -g mmv="noglob zmv -W"
# VSC status
autoload -Uz vcs_info
precmd() {
	vcs_info
	print -Pn "\e]0;%m:%~\a"
}
setopt prompt_subst
PS1='%B%F{blue}%n%f%b@%m %B%40<..<%1~ %<<${vcs_info_msg_0_}%b%# '
# Common keys
# Codes gotten using zsh's zkbd
source ~/.zkbd/${TERM}-${${DISPLAY:t}:-$VENDOR-$OSTYPE}
[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}"  beginning-of-line
[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}"  up-line-or-history
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}"  delete-char
[[ -n ${key[End]} ]] && bindkey "${key[End]}"  end-of-line
[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}"  down-line-or-history
# Window naming
preexec () { print -Pn "\e]0;$1\a" }

# TMUX
[[ -z $SSH_CONNECTION && -z $TMUX && $(tty) != "/dev/tty1" ]] && (tmux attach || tmux new-session)
