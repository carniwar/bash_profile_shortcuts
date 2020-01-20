alias ll="ls -la"

# Maven
alias mci="mvn clean install"
alias mciu="mvn clean install -U"
alias mct="mvn clean test"

# Git
alias gup="git pull"
alias grv="git reset --hard"
alias grb="git reset --hard HEAD~1"
alias gst="git status"
alias gco="git checkout $1"
alias grm="git branch -D $1"
alias gls="git branch -a"
alias gdf="git diff"
# Show GIT branch name in the CLI path
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

#Docker
function dstop() {
  docker stop $(docker ps -a -q)
}
function dremove() {
  docker rm $(docker ps -a -q)
}
