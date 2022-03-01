
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Utils
source ~/.utils.sh

# gvm
source /home/karlis/.gvm/scripts/gvm

alias tree="exa -aT -I '.git|node_modules|vendor|vendors' --level=7 "$@""
alias gs="git status -sb"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' "$@""
alias master="git checkout master"
alias Projects="cd ~/Projects"
alias be="bundle exec"
alias spotify_full_screen_off="sudo wmctrl -r spotify -b remove,fullscreen"
alias generate-rand-base64="openssl rand -base64 64"
docker_kill_all() { docker kill $(docker ps -q); }
alias teamviewer_kill="sudo /opt/teamviewer/tv_bin/script/teamviewerd.sysv stop"

alias migrate-up="sql-migrate up -env="development" -config="./config/database.yaml""
alias migrate-down="sql-migrate down -env="development" -config="./config/database.yaml""
alias migrate-new="sql-migrate new -env="development" -config="./config/database.yaml""

alias migratep-up="sql-migrate up -env="development" -config="./conf/database.yaml""
alias migratep-down="sql-migrate down -env="development" -config="./conf/database.yaml""
alias migratep-new="sql-migrate new -env="development" -config="./conf/database.yaml""


alias untar="tar xvzf "
alias postgres_start="pg_ctl -D /usr/local/var/postgres start"
alias postgres_stop="pg_ctl -D /usr/local/var/postgres stop"
alias clear_monero_rpcs="kill -9 $(lsof -wnti tcp:17083) && kill -9 $(lsof -wnti tcp:17084) && kill -9 $(lsof -wnti tcp:17085) && kill -9 $(lsof -wnti tcp:17086) && kill -9 $(lsof -wnti tcp:17087) && kill -9 $(lsof -wnti tcp:17088)"

alias git-fix="git add -A && git commit -m 'fix' && git push origin $(git symbolic-ref --short -q HEAD)"
alias bandwich="sudo ~/.cargo/bin/bandwhich"
alias cpu_temp="sudo powermetrics --samplers smc |grep -i 'CPU die temperature'"
alias generate_ssh_key="ssh-keygen -t ed25519 -C"
# alias gvm="~/Projects/go/bin/g" # gvm, go version manager

export GOPATH=~/Projects/go
export PATH=$PATH:$GOPATH/bin
