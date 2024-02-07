#! bash oh-my-bash.module
#------------------------------------------------------------------------------
# Note on copyright (2022-08-23): The aliases defined in this file seems to
# originally come from a blog post [1].  See also the comments in lib/base.sh.
#
# [1] Nathaniel Landau, "My Mac OSX Bash Profile",
#     https://natelandau.com/my-mac-osx-bash_profile/, 2013-07-02.
#
#------------------------------------------------------------------------------
#  Description:  This file holds all general BASH aliases
#
#  For your own benefit, we won't load all aliases in the general, we will
#  keep the very generic command here and enough for daily basis tasks.
#
#  If you are looking for the more sexier aliases, we suggest you take a look
#  into other core alias files which installed by default.
#
#------------------------------------------------------------------------------

#   -----------------------------
#   1.  MAKE TERMINAL BETTER
#   -----------------------------

# Determines the use of the option `-v' on the first call
# Ref. https://github.com/ohmybash/oh-my-bash/issues/351
function _omb_alias_general_cp_init {
  if (tmp=$(_omb_util_mktemp); trap 'rm -f "$tmp"{,.2}' EXIT; command cp -v "$tmp" "$tmp.2" &>/dev/null); then
    alias cp='cp -iv' && function _omb_alias_general_cp_init { command cp -iv "$@"; }
  else
    alias cp='cp -i' && function _omb_alias_general_cp_init { command cp -i "$@"; }
  fi &&
    _omb_alias_general_cp_init "$@"
}
function _omb_alias_general_mv_init {
  if (tmp=$(_omb_util_mktemp); trap 'rm -f "$tmp.2"' EXIT; command mv -v "$tmp" "$tmp.2" &>/dev/null); then
    alias mv='mv -iv' && function _omb_alias_general_mv_init { command mv -iv "$@"; }
  else
    alias mv='mv -i' && function _omb_alias_general_mv_init { command mv -i "$@"; }
  fi &&
    _omb_alias_general_mv_init "$@"
}
function _omb_alias_general_mkdir_init {
  if command mkdir -pv . &>/dev/null; then
    alias mkdir='mkdir -pv' && function _omb_alias_general_mkdir_init { command mkdir -pv "$@"; }
  else
    alias mkdir='mkdir -p' && function _omb_alias_general_mkdir_init { command mkdir -p "$@"; }
  fi &&
    _omb_alias_general_mkdir_init "$@"
}

alias cp='_omb_alias_general_cp_init'       # Preferred 'cp' implementation
alias mv='_omb_alias_general_mv_init'       # Preferred 'mv' implementation
alias mkdir='_omb_alias_general_mkdir_init' # Preferred 'mkdir' implementation
alias ll='ls -lAFh'                         # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias nano='nano -W'                        # Preferred 'nano' implementation
alias wget='wget -c'                        # Preferred 'wget' implementation (resume download)
alias c='clear'                             # c:            Clear terminal display
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias fix_term='echo -e "\033c"'            # fix_term:     Reset the conosle.  Similar to the reset command
alias cic='bind "set completion-ignore-case on"' # cic:          Make tab-completion case-insensitive
alias src='source ~/.bashrc'                # src:          Reload .bashrc file

### personal use
alias art='php artisan'
alias crt='crontab'
alias py3='python3'
alias lv='lvim'
alias gc='gcc -o ${1%.c} $1'
alias tm='tmux'

### docker
alias dve="docker -v"
alias dl="docker login --username=dragol"
alias dil="docker images"
alias dip="docker image prune -f"
alias dcl="docker ps"
alias dcla="docker ps -a"
alias dcp="docker container prune -f"
alias dci="docker inspect"
alias dciip="docker inspect -f \"{{ .NetworkSettings.IPAddress }}\""
alias dcs="docker start"
alias dcd="docker down"
alias dcr="docker restart"
alias dnl="docker network ls"
alias dni="docker network inspect"
alias dnrm="docker network rm"
alias dnp="docker network prune -f"
alias dvc="docker volume create"
alias dvl="docker volume ls"
alias dvrm="docker volume rm"
alias dvp="docker volume prune -f"
alias dvi="docker volume inspect"
alias dcv="docker-compose -v"
alias dcu="docker-compose up"
alias dcd="docker-compose down"
alias dcb="docker-compose build --no-cache"
alias dcc="docker-compose config"

### yarn
alias y="yarn"
alias yi="yarn init -y"
alias ya="yarn add"
alias yr="yarn remove"
alias yad="yarn add -D"
alias yga="yarn global add"
alias ygr="yarn global remove"
alias yu="yarn upgrade"
alias ygu="yarn global upgrade"
alias ycc="yarn cache clean"
alias yrun="yarn run"
alias yl="yarn list --depth=0"
alias ygl="yarn global list --depth=0"
alias yo="yarn outdated"
alias yd="yarn dev"
alias ys="yarn serve"
