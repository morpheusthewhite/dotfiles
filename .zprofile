#
# ~/.zsh_profile
# contains aliases and variables which are environment-indipendent

export VISUAL=nvim
export EDITOR="$VISUAL"

alias enable_fn='echo 0 | sudo tee /sys/module/hid_apple/parameters/fnmode > /dev/null'

# ssh to WEEEOpen lab Raspberry
alias sshpirla="ssh alarm@lab.weeeopen.it -p 2269"
# local when /inlab
alias sshpirlal="ssh alarm@pi-rla.lab.weeeopen.it"

alias diff="diff --color"
alias docker-start-uml="docker run -d -p 8080:8080 plantuml/plantuml-server:jetty"

alias ddd161="ddd --debugger mips-harvard-os161-gdb kernel"

alias xcolors='msgcat --color=test'

alias z="vim ~/.zsh_profile"
alias h="history | grep"
alias p="ps aux | grep"

alias xt="tar xfv"
alias xzp="unzip"

alias xo="xdg-open"

alias vim="nvim"
alias v="nvim"

alias bat="bat --plain"

# functions and other funny things

#
# mktestenv(ironment)
# create a temporary folder and copy all passed argument to it
#
mktestenv(){
    temp_dir=$(mktemp -d)
    
    until [ -z "$1" ]
    do
        cp "$1" "${temp_dir}"
        shift
    done
    
    cd "${temp_dir}"
}

# 
# cdd(eeper) 
# if the passed directory contains only one folder, cdd to it
#
cdd(){
    cd "$1"

    # execute this part only if the cd command succedeed
    if [[ $? -eq 0 ]]
    then
        # select folders in the current directory
        folders=$(ls -l | grep "^d")

        # act only if there is one directory
        if [ ! -z "${folders}" -a $(echo $folders | wc -l) -eq 1 ] 
        then
            # recursive call
            folder=$(echo $folders | awk '{ print $NF }')
            cdd "${folder}"
        fi
    fi

}

# beautify less
export LESS='--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-4'
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

alias ls="exa"
alias l="exa -al"
