# Golang
# Go development
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="${PATH}:${GOPATH}/bin:${GOROOT}/bin"

test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"


if type brew &>/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [[ -r "$COMPLETION" ]] && source "$COMPLETION"
    done
  fi
fi


PS1="\[\e[1;32m\]\w\[\e[0m\]\n\[\e[1;34m\]\d \t \[\e[0m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]"

# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"


alias gmain='git checkout main'
alias gdevelop='git checkout develop'
alias gstatus='git status'
alias gbranch='git branch'
alias gbranches='git branch -a'
alias gpr='git checkout -b '
alias gtree='git log --oneline --all --graph --decorate'
alias gfetch='git fetch origin --prune'
alias gprune='git branch -vv | grep '\''origin/.*: gone]'\'' | awk '\''{print $1}'\'' | xargs git branch -D'
alias gfresh='git stash; gfetch; gdevelop; git pull; gprune; gbranch;'
alias grevert='git reset --soft HEAD~1'

alias ll='ls -lFah'
alias lsa='ls -alFG'
alias gpull='git pull'
alias pushd='pushd ./'
alias pip='pip3'

alias cdcode='cd ~/development'
alias cdgo='cd ~/.go/src/github.com/meetcircle'
alias emacs='emacs --no-window-system'

alias mvn-build='mvn clean install'
alias mvn-spring-run='mvn spring-boot:run'

alias alias-apply='source ~/.bash_profile'
alias alias-edit='atom ~/.bash_profile'

alias printenv='printenv | sort'


# Set iTerm2 tab titles
tabTitle() { echo -ne "\033]0;"$*"\007"; }

# Always list directory contents and set title upon 'cd'
cd() { builtin cd "$@"; ls -lFah; tabTitle ${PWD##*/}; }
cd ./

readme () {
  pandoc $1 | lynx -stdin
}

gitfeature() {
  git checkout -b feature/$1
}

grepkill() {
  kill $(ps aux | grep $1 | awk '{print $2}')
}

jdk() {
        version=$1
        export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
        java -version
 }

jdk 14
export PATH=~/.local/bin:$PATH
export PATH="/usr/local/sbin:$PATH"
