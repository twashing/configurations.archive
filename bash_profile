
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

if [ -f ~/.local/bin/bashmarks.sh ]; then
  source ~/.local/bin/bashmarks.sh
fi

function ubuntu-version {
  lsb_release -a
}
function ubuntu-packages {
  dpkg --get-selections | grep -v deinstall
}
function git-log-tree {
  git log --all --graph --decorate --oneline --simplify-by-decoration
}

set -o emacs

export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
export JAVA_HOME="/usr/lib/jvm/java-7-openjdk-amd64"
#export JRE_HOME="/usr/lib/jvm/jdk1.7.0_25/jre"
export PROJECTS_HOME="~/Projects"
export CLOJURESCRIPT_HOME="$PROJECTS_HOME/bkell/vendor/clojurescript"
export PATH="$PATH:\
~/bin/:\
~/.cask/bin:\
~/Downloads/vmware-server-distrib/bin/:\
$JAVA_HOME/bin:\
$JRE_HOME/bin:\
$PROJECTS_HOME/vimclojure-nailgun-client/:\
$CLOJURESCRIPT_HOME/bin:\
$CLOJURESCRIPT_HOME/script:\
$HOME/local/node/bin:\
/opt/adt-bundle-linux-x86_64-20131030/sdk/platform-tools:\
/opt/adt-bundle-linux-x86_64-20131030/sdk/tools"

export NODE_PATH=$HOME/local/node:$HOME/local/node/lib/node_modules


alias em="emacs"
alias ec="emacsclient"
alias emacsc="emacsclient"
alias ll="ls -la --color"
alias llc="ls -l --color"
alias lsc="ls -aG --color"
alias cls="clear"
alias gk="g bk"
alias gkp="g bkp"
alias gnn="g nn"
alias gt="g tls"
alias gb="g bin"
alias gp="g prj"
alias gd="g dwn"
alias gi="g in"
alias gip="g ip"

alias ebashp="vim ~/.bash_profile"
alias evimrc="vim ~/.vimrc"
alias lrepl="lein repl"
alias rf="rm -rf"
alias gdif="git diff --name-only"
alias gdiff="git diff"

#function sea { apt-cache search $1 | grep -C 500 $1; }
#alias sea2="sea --names-only"
#function ins { sudo apt-get install -y $* && aptn "Installed $@" }
#function rem { sudo apt-get remove -y $* && aptn "Removed $@" }
#alias upd="sudo apt-get update"





# EXAMPLES
#
# removing sub-directories in git
# git update-index --force-remove <your-dir>

# return uncommitted working tree to the last committed state with
# git reset --hard HEAD
# git reset HEAD somefile.txt

emacs --daemon > /dev/null 2>&1 &


if [ -f ~/.bash_local ]; then
  . ~/.bash_local
fi

