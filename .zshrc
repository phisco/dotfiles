export ZSH=/home/phisco/.oh-my-zsh
ZSH_THEME="bira"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="mm/dd/yyyy"

plugins=(
  cabal
  docker
  git
  sudo
  suse
  systemd
  vi-mode
  virtualenvwrapper
  web-search
  zsh-syntax-highlighting
)
alias takeover="tmux detach -a"
source $ZSH/oh-my-zsh.sh
export WORKON_HOME=$HOME/.virtualenvs
export PATH=$HOME/.local/bin:$HOME/go/bin:$PATH
source /usr/bin/virtualenvwrapper.sh
export WORKON_HOME=~/Envs
export GOPATH=$HOME/go
export npm_config_prefix=$HOME/.node_modules
export PATH=$PATH:$npm_config_prefix/bin
export PATH=$PATH:/opt/gradle/gradle-4.8.1/bin
# export PYSPARK_DRIVER_PYTHON=jupyter
# export PYSPARK_DRIVER_PYTHON_OPTS='notebook'
#export SPARK_HOME=/opt/spark
#export PATH=$SPARK_HOME/bin:$PATH
# export PYSPARK_SUBMIT_ARGS=" --master local[2] pyspark-shell"


# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/home/phisco/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/home/phisco/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/home/phisco/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/phisco/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
export PATH=$PATH:/opt/gitkraken
alias "docker"="sudo docker"
alias "docker-compose"="sudo docker-compose"
alias "sail"="sudo systemctl start docker"
export VIRTUALENVWRAPPER_PYTHON="/usr/bin/python3"

rmd (){
pandoc $1 | lynx -stdin
}

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /home/phisco/.local/bin/vault vault
