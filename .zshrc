# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="nebirhos"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(rails3 git ruby brew bundler rvm gem)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/Users/dhirengupta/.rvm/gems/ree-1.8.7-2012.02@kg/bin:/Users/dhirengupta/.rvm/gems/ree-1.8.7-2012.02@global/bin:/Users/dhirengupta/.rvm/rubies/ree-1.8.7-2012.02/bin:/Users/dhirengupta/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

#custom aliases
alias kg='cd ~/office/kg323'
alias main='cd ~/office/khojguru/branches/main'
alias fb='cd ~/office/fb'
alias yp='cd ~/office/yp'
alias rl='cd ~/office/rl'
alias rf='cd ~/office/rechargefree'
alias rc='ruby script/console'
alias ss='cd ~/office/apache-solr-4.0/example; java -jar start.jar'
alias rs='cd ~/office/khojguru/branches/main;ruby script/server'
alias js='cd ~/Dhiren/rails/jewellery_store'
alias cr='cd ~/Dhiren/rails/coducer'
alias remigrate='rake db:drop;rake db:create; rake db:migrate'
alias store='cd ~/Dhiren/rails/store'
alias poller='ruby script/poller run'
alias load_store_test='cd ~/Desktop;mysqldump -u root store_development > store_dump.sql;mysql -u root store_test < store_dump.sql; rm store_dump.sql'
alias backup_store='cd ~/Dhiren/backup;mysqldump -u root store_development > store.sql'
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast' 
alias cpzsh='cp ~/.zshrc ~/Dhiren/dotfiles;cd ~/Dhiren/dotfiles'
