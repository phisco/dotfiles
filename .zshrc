export ZSH=/home/phisco/.oh-my-zsh
export EDITOR=`which vim`
export KUBE_PS1_SYMBOL_USE_IMG=true
export POWERLEVEL9K_MODE='awesome-fontconfig'
export POWERLEVEL9K_SHORTEN_STRATEGY='truncate_from_right'
export POWERLEVEL9K_SHORTEN_DELIMITER=""
export POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
ZSH_THEME="powerlevel9k/powerlevel9k"
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs newline)
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(root_indicator dir_writable os_icon background_jobs)
#ZSH_THEME="bira"
#ZSH_THEME="robbyrussell"

COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="mm/dd/yyyy"
export ZSH_TMUX_AUTOSTART=true

plugins=(
  #sudo
  common-aliases
  docker
  encode64
  git
  kube-ps1
  kubectl
  suse
  systemd
  tmux
  vagrant
  vi-mode
  virtualenvwrapper
  vscode
  web-search
  zsh-completions
  zsh-syntax-highlighting
)
alias takeover="tmux detach -a"
source /home/phisco/github/kube-ps1/kube-ps1.sh
source $ZSH/oh-my-zsh.sh
#source /usr/share/fzf/key-bindings.zsh
#source /usr/share/fzf/completion.zsh
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
alias "sudo"="sudo "
alias "docker"="sudo docker"
alias "docker-compose"="sudo docker-compose"
alias "sail"="sudo systemctl start docker"
export VIRTUALENVWRAPPER_PYTHON="/usr/bin/python3"

rmd (){
pandoc $1 | lynx -stdin
}

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /home/phisco/.local/bin/vault vault
source /home/phisco/.local/bin/aws_zsh_completer.sh

alias "kl"="kubectl"
alias "chmod-file"="find . -type d -exec chmod 775 {} \;"
alias "chmod-dir"="find . -type f -exec chmod 644 {} \;  "
alias "wa"="watch -n 1 "
alias "v"="nvim"
alias "vim"="nvim"
eval "$(direnv hook zsh)"

export CLASSPATH="/usr/local/lib/antlr-4.7.1-complete.jar:$CLASSPATH"
export GOROOT="/usr/lib64/go/1.11"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
git config --global alias.logtree 'log --graph --all --oneline'
