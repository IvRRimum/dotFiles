export GOBIN=$GOPATH/bin


export PATH=$PATH:/usr/local/go/bin:$GOROOT/bin:$GOPATH/bin:$GOBIN:/usr/local/packer:/home/karlis/bin/godep:$PATH:$GOROOT/bin

export CPLUS_INCLUDE_PATH=${CPLUS_INCLUDE_PATH}:~/Projects/search/rocksdb/include                                             
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:~/Projects/search/rocksdb/
export LIBRARY_PATH=${LIBRARY_PATH}:~/Projects/search/rocksdb/
export ANDROID_HOME=/home/karlis/Projects/my-instagram/android-sdk-linux

export GOROOT=/usr/local/go
export GOPATH=$HOME


#TERM=xterm-256color
tmux

alias gs="git status"
alias db_reset="rake db:drop; rake db:create; rake db:migrate; rake db:seed"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

###-tns-completion-start-###
if [ -f /home/karlis/.tnsrc ]; then 
    source /home/karlis/.tnsrc 
fi
###-tns-completion-end-###

alias clear_es="curl -XDELETE 'http://ec2-54-158-214-116.compute-1.amazonaws.com:9200/asdsad/'"
alias aws_ssh="ssh -i ~/.ssh/commonsearch.pem ec2-user@ec2-54-158-214-116.compute-1.amazonaws.com"
alias stop_tw="sudo teamviewer --daemon stop"
alias python3.5="/opt/python3.5/bin/python3.5" # /opt/python3.3/bin/pyvenv -- to create an env
