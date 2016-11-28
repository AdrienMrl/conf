alias adb=/Users/sevauk/Library/Android/sdk/platform-tools/adb
alias cr="cargo run"
alias cb="cargo build"
alias mmayor="~/bin/interro.py ~/bin/memory_mayor.dat"
alias vps="ssh sevauk@vps"
alias cinédb="mysql -u cinema cinema"
alias nm="node main.js"
alias ns="npm start --"
alias msgfmt="/usr/local/opt/gettext/bin/msgfmt"
alias rml="repeat 1000"

alias client="npm run daemon -r dotenv/config"

export PATH=$PATH:~/bin:~/code/epitech/storeit/src/
export PATH=$PATH:/usr/local/texlive/2015basic/bin/x86_64-darwin
export EDITOR=vim
export GOPATH=$HOME/go

set -o vi

function mark {

	mkdir ~/.marks 2> /dev/null
	echo $1 > ~/.marks/$2
}

function jump {
	cd $(cat ~/.marks/$1)
}

function look {
  grep $1 **/*.$2
}

export OPENSSL_INCLUDE_DIR=/usr/local/opt/openssl/include
export OPENSSL_ROOT_DIR=/usr/local/opt/openssl

export PROMPT='%(?,💡  ,☠   )%f'


# StoreIt stuff
alias kk="pkill Python"
alias psqls="postgres -D /usr/local/var/postgres&"
alias tk="tmux kill-session -t storeit"

function simu {
  repeat 100000 (tmux attach-session -t storeit 2> /dev/null ; echo -n "." ; sleep 0.5)
}

function weather {
  curl wttr.in
}

function work_on_storeit {
  jump sproto
  atom .
  psqls
  simu
}

alias stlog="tail -n 25 /tmp/storeit-server.log"

alias storeit=work_on_storeit

# end of storeit stuff
# beginning of convert utilities

function resize {
  convert $1 -resize $2 $1
}

function issue {
  git checkout -b $1
  git push origin $1
}

function merge {
  git co master
  git merge $1 --no-ff
  git push origin --delete $1
}

# OPAM configuration
. /Users/adri/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

ssh-add ~/.ssh/github_key
