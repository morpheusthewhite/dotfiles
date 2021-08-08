# If you come from bash you might have to change your $PATH.
# export PATH=$PATH:/usr/lib/jvm/jdk-11/bin

PATH=$PATH:$HOME/.local/bin

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="classyTouch"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# For adding completion, follow https://www.dev-diaries.com/blog/terminal-history-auto-suggestions-as-you-type/
plugins=(
  git autojump archlinux colored-man-pages vi-mode zsh-autosuggestions 
)

# automatically starts tmux
# ZSH_TMUX_AUTOSTART=true
# ZSH_TMUX_AUTOCONNECT=false
# ZSH_TMUX_AUTOQUIT=true
source $ZSH/oh-my-zsh.sh

# vimify all
#bindkey -v

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# autojump configuration

#[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source /home/francesco/.autojump/etc/profile.d/autojump.sh

#autoload -U compinit && compinit -u

# global (valid for all machines) aliases
source ~/.zprofile

# local (to a specific machine) aliases
source ~/.zprofile.local

# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/opt/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/opt/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<

# pywal autostart
# cat .cache/wal/sequences > /dev/null &

# see more tricks here
# https://www.arp242.net/zshrc.html

insert_sudo() { zle beginning-of-line; zle -U "sudo "; }

zle -N insert_sudo insert_sudo

bindkey '^A' insert_sudo

# fix smart history navigation which gets broken with vi-mode plugin
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey '^P' up-line-or-beginning-search
bindkey '^N' down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

bindkey '^L' autosuggest-accept

# big brain completion, follow https://www.dev-diaries.com/blog/terminal-history-auto-suggestions-as-you-type/
source $HOME/.oh-my-zsh/custom/plugins/zsh-histdb/sqlite-history.zsh
autoload -Uz add-zsh-hook

# Query to pull in the most recent command if anything was found similar
# in that directory. Otherwise pull in the most recent command used anywhere
# Give back the command that was used most recently
# _zsh_autosuggest_strategy_histdb_top_fallback() {
#     local query="
#     select commands.argv from
#     history left join commands on history.command_id = commands.rowid
#     left join places on history.place_id = places.rowid
#     where places.dir LIKE
#         case when exists(select commands.argv from history
#         left join commands on history.command_id = commands.rowid
#         left join places on history.place_id = places.rowid
#         where places.dir LIKE '$(sql_escape $PWD)%'
#         AND commands.argv LIKE '$(sql_escape $1)%')
#             then '$(sql_escape $PWD)%'
#             else '%'
#             end
#     and commands.argv LIKE '$(sql_escape $1)%'
#     group by commands.argv
#     order by places.dir LIKE '$(sql_escape $PWD)%' desc,
#         history.start_time desc
#     limit 1"
#     suggestion=$(_histdb_query "$query")
# }
# ZSH_AUTOSUGGEST_STRATEGY=histdb_top_fallback

# This will find the most frequently issued command issued exactly in this
# directory, or if there are no matches it will find the most frequently issued
# command in any directory. You could use other fields like the hostname to
# restrict to suggestions on this host, etc.
_zsh_autosuggest_strategy_histdb_top() {
    local query="select commands.argv from
history left join commands on history.command_id = commands.rowid
left join places on history.place_id = places.rowid
where commands.argv LIKE '$(sql_escape $1)%'
group by commands.argv
order by places.dir != '$(sql_escape $PWD)', count(*) desc limit 1"
    suggestion=$(_histdb_query "$query")
}

ZSH_AUTOSUGGEST_STRATEGY=histdb_top


# add in a command to show the local history only
show_local_history() {
    limit="${1:-10}"
    local query="
        select history.start_time, commands.argv
        from history left join commands on history.command_id = commands.rowid
        left join places on history.place_id = places.rowid
        where places.dir LIKE '$(sql_escape $PWD)%'
        order by history.start_time desc
        limit $limit
    "
    results=$(_histdb_query "$query")
    echo "$results"
}
