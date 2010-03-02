# ~/.bashrc is executed when non-login interactive shells are started

# Convenience aliases
alias ls="ls -G"
alias l="ls -lhGa"
alias g="git"
alias s="svn"
alias i="irb"
alias r="rak"
# Workaround Snow Leopard vim exit code problem
alias vim=`which vim`

# Get local (not shared across machines) settings
# Primarily for local aliases
if [ -f ~/.localrc.bash ]; then
        source ~/.localrc.bash
fi

if [ -f ~/.bash.d/git-completion.bash ]; then
        source ~/.bash.d/git-completion.bash
fi

# Print non-zero exit codes in prompt
# Needs to run first in prompt to get the previous exit code
__last_status_ps1() {
  LAST="$?";
  if [ "$LAST" -ne "0" ]
  then
     printf $'\e[1m\e[41m\e[33m' # red bg/white fg
     printf "Exited with $LAST!"
     printf $'\e[0m' # reset colors
  fi
}

# Wrap text in multiple colors, specified by color code number.
#
# Standard bash color codes:
# Black       0;30     Dark Gray     1;30
# Blue        0;34     Light Blue    1;34
# Green       0;32     Light Green   1;32
# Cyan        0;36     Light Cyan    1;36
# Red         0;31     Light Red     1;31
# Purple      0;35     Light Purple  1;35
# Brown       0;33     Yellow        1;33
# Light Gray  0;37     White         1;37
# 
# Usage: __cwrap text color1 [color2 [color3 ... ]]
# For 'bold' colors (second column), specify '1' separately.
# e.g.
# __cwrap "Sample text" 1 30
# 
__cwrap(){
        local color_text=$1
        shift
        while [ "$#" -ne "0" ]; do
          printf $'\e['
          printf $1
          printf $'m'
          shift
        done
        printf $color_text
        printf $'\e[0m' # reset colors
}

# TODO: svn dirty/clean
__svn_rev() {
        LANG='C' svn info 2>/dev/null | awk '/Revision:/ {print $2; }'
}

__svn_branch() {
        LANG='C' svn info 2>/dev/null | awk '/URL/ {match($2,/(branches(\/.*)?\/?|tags(\/.*)?\/?|trunk)/);print substr($2,RSTART,RLENGTH)}'
}

# TODO: git dirty/clean
# Print out scm stuff. Colorize where possible.
__scm_ps1() {
        local git_ps1_output=`__git_ps1 "|%s|" 2>/dev/null`
        if [ $git_ps1_output ]; then
                __cwrap $git_ps1_output 1\;32
        fi
        local svn_rev_output=$(__svn_rev)
        local svn_branch_output=$(__svn_branch)
        if [ $svn_rev_output ]; then
                if [ $svn_branch_output ]; then
                        local svn_branch_output="$svn_branch_output@"
                fi
                __cwrap "|${svn_branch_output}r$svn_rev_output|" 1\;36
        fi
}

__rvm_ps1() {
	if [[ -s /Users/lchin/.rvm/scripts/rvm ]] ; then
		local rvm_ps1=`~/.rvm/bin/rvm-prompt i v`
	fi
	if [ $rvm_ps1 ]; then
		__cwrap "|${rvm_ps1}|" 1\;31
	else
		__cwrap "|system|" 1\;31
	fi
}


# Prompts
declare +x PS1
# On line 2, non-printable chars are surrounded with \[ \] to help line wrapping
PS1=$'$(__last_status_ps1)$(__cwrap [!\!@\A][j:\j][\w] 47)$(__scm_ps1)$(__rvm_ps1)\n\[$(__cwrap \]\u\[ 1\;35)\]@\[$(__cwrap \]\h\[ 1\;30)\] \$ '

# Shell options
shopt -s checkwinsize
shopt -s cdspell
# RVM
if [[ -s /Users/lchin/.rvm/scripts/rvm ]] ; then source /Users/lchin/.rvm/scripts/rvm ; fi

