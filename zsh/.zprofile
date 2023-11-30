### zsh native functions

insert_sudo() { zle beginning-of-line; zle -U "sudo "; }
zle -N insert_sudo insert_sudo

### keybindings

# fix smart history navigation which gets broken with vi-mode plugin
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey '^P' up-line-or-beginning-search
bindkey '^N' down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

bindkey '^A' insert_sudo

### completion

autoload -U +X bashcompinit && bashcompinit
# complete -o nospace -C /opt/homebrew/bin/terraform terraform

### aliases

alias ls="exa"
alias l="exa -al"
alias la="exa -alh"

alias vim=nvim
alias vi=nvim
alias v=nvim

alias gs="git status"
alias gspo="git stash pop"
alias gspu="git stash push -u"
alias gspuk="git stash push -u -k"
alias gdc="git diff --cached"
alias gcam="git commit --amend --no-edit"
alias gcame="git commit --amend"

alias tf="terraform" 

alias tg="terragrunt"
alias tga="terragrunt apply"
alias tgac="terragrunt apply -auto-approve"
alias tgap="terragrunt run-all apply --terragrunt-parallelism 5"
alias tgaa="terragrunt apply -auto-approve > /dev/null &"
alias tgc="rm -rf .terragrunt-cache"
alias tfmt="terraform fmt -recursive; terragrunt hclfmt"

alias kctx="kubectx"
alias kns="kubens"
alias kd="kubectl describe"
alias kg="kubectl get"

alias rg="rg -B=1 -A=1"

alias mktempenv="cd $(mktemp -d)"

### functions

gro () {
    GIT_ROOT="$(git rev-parse --show-toplevel)"
    echo "$GIT_ROOT"
    cd "$GIT_ROOT"
}

recover_kc_state () {
    # full sink name (including s3sink-1 suffix)
    sink_name="${1}"
    topic_name=$(echo ${sink_name} | sed 's/\(.*\)-s3sink-.*/\1/')

    curl -v localhost:8084/connectors/${sink_name}/status | jq . 
    echo "Will apply changes in 3 seconds (Ctrl-C to stop)"

    sleep 3 && terragrunt import "kafka-connect_connector.s3_sink[\""${topic_name}"\"]" "${sink_name}"
}

# fzf wrapper for changing directory
f () {
    dir=$(fd --type directory | fzf)
    
    # if failed, do not change dir
    if [ ! $? -eq 0 ]; then; dir="."; fi

    cd ${dir}
}

get_report_dependencies() {
    report_json="$1"
    cat "${report_json}" | jq '.dependencies | .[] | .fileName' | sort
}

copy(){
    file="$1"
    cat "${file}" | pbcopy
}

mysql_command() {
    # Get the database URL from the command-line argument
    DB_URL="$1"

    # Parse the database URL
    DB_USER=$(echo "$DB_URL" | sed -n 's/mysql:\/\/\([^:]*\):[^@]*@.*/\1/p')
    DB_PASSWORD=$(echo "$DB_URL" | sed -n 's/mysql:\/\/[^:]*:\([^@]*\)@.*/\1/p')
    DB_HOST=$(echo "$DB_URL" | sed -n 's/mysql:\/\/[^:]*:[^@]*@\([^:]*\):[^/]*.*/\1/p')
    DB_PORT=$(echo "$DB_URL" | sed -n 's/mysql:\/\/[^:]*:[^@]*@[^:]*:\([0-9]*\).*/\1/p')
    DB_NAME=$(echo "$DB_URL" | sed -n 's/mysql:\/\/[^:]*:[^@]*@[^:]*:[0-9]*\/\(.*\)/\1/p')

    # Construct the MySQL command
    MYSQL_CMD="mysql -h $DB_HOST -P $DB_PORT -u $DB_USER -p$DB_PASSWORD $DB_NAME"

    # Print the MySQL command
    echo "$MYSQL_CMD"
}
