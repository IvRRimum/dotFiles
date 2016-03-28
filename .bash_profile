[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH=$PATH:/usr/local/go/bin
# export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"
export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"
mysql.server start 
tmux

alias gs="git status"
alias pullbpo="rsync -a --delete-after --progress 1188:/data/developers/kcudars0/bpo_crm ../"
alias pushbpo="rsync -a --delete-after --progress ./ 1188:/data/developers/kcudars0/bpo_crm"

alias pullpor="rsync -a --delete-after --progress 1188:/data/developers/kcudars0/portal_v3 ../"
alias pushpor="rsync -a --delete-after --progress ./ 1188:/data/developers/kcudars0/portal_v3"
