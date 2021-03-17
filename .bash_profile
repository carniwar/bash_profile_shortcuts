alias ll="ls -la"

# Maven
alias mci="mvn clean install"
alias mciu="mvn clean install -U"
alias mct="mvn clean test"

# Git
alias g=git
alias gup="git pull --prune"
alias grv="git reset --hard"
alias grb="git reset --hard HEAD~1"
alias gst="git status"
alias gc="git commit -m"
alias gco="git checkout $1"
alias grm="git branch -D $1"
alias gls="git branch -a"
alias gdf="git diff"
gclean() {
    gco master
    gup
    #git branch --merged | sed '/master/d' | xargs git branch -d
    git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -D
}
# Show GIT branch name in the CLI path
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# Docker
function dlist() {
  docker ps -a
}
function dstop() {
  docker stop $(docker ps -a -q)
}
function dremove() {
  docker rm $(docker ps -a -q)
}

# Postgres
function psql-start() {
  # docker run --name postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres
  docker start postgres
}
function psql-stop() {
  docker stop postgres
}

# Bash completion
source /usr/share/bash-completion/bash_completion

# K8
alias k=kubectl
source /home/castanon/.kube/kubectl-bash-completion

# GPG
alias gpg-generate="gpg --full-generate-key"
alias gpg-export="gpg --output ~/felipe.key --armor --export"
alias gpg-import="gpg --import"
alias gpg-encrypt="gpg --output encrypted.asc --encrypt"
alias gpg-decrypt="gpg --output decrypted.asc --decrypt"

# https://github.com/blendle/kns
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
