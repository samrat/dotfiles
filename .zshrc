# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="steeef"

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
GIT_DISCOVERY_ACROSS_FILESYSTEM="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git arch pip fabric lein redis-cli vagrant)

source $ZSH/oh-my-zsh.sh

autoload -U compinit
compinit

# Customize to your needs...
export PATH=/home/samrat/.gem/ruby/1.9.1/:/root/.gem/ruby/1.9.1/:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl:/home/samrat/.gem/ruby/1.9.1/bin:/usr/local/texlive/2012/bin/x86_64-linux:/home/samrat/.gem/ruby/2.0.0/bin:/home/samrat/bin
export MANPATH=/usr/local/texlive/2012/texmf/doc/man:$MANPATH
export INFOPATH=/usr/local/texlive/2012/texmf/doc/info:$INFOPATH
export PYTHONPATH="$PYTHONPATH:/usr/local/lib/python2.7.1/site-packages"
export PYTHONPATH="$PYTHONPATH:/usr/local/lib/python2.7/site-packages"
export EDITOR="emacsclient -t"
export BROWSER="conkeror"

export _JAVA_AWT_WM_NONREPARENTING=1

export ARDUINO_DIR=/usr/share/arduino
export ARDMK_DIR=/usr/local
export AVR_TOOLS_DIR=/usr

# Z
source /usr/bin/z.sh

# TMUX
if which tmux 2>&1 >/dev/null; then
        #if not inside a tmux session, and if no session is started, start a new session
        test -z "$TMUX" && (tmux attach || tmux new-session)
fi

# Virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python

alias t='python2.7 /usr/bin/t/t.py --task-dir ~/Dropbox/.tasks --list tasks'
alias g='git '

alias serve='python2 -m SimpleHTTPServer '

alias c='clear'

alias e=emacsclient -t
alias ec=emacsclient -c

alias qwerty='setxkbmap -layout us; ctrl-fix'
alias colemak='setxkbmap us -variant colemak; ctrl-fix'

alias batti='$HOME/lib/batti/main.sh -g 4 -t'
PATH="/usr/local/heroku/bin:$PATH"
