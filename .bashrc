#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."

[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

################################################################################
## Some generally useful functions.
## Consider uncommenting aliases below to start using these functions.
##
## October 2021: removed many obsolete functions. If you still need them, please look at
## https://github.com/EndeavourOS-archive/EndeavourOS-archiso/raw/master/airootfs/etc/skel/.bashrc

_open_files_for_editing() {
    # Open any given document file(s) for editing (or just viewing).
    # Note1:
    #    - Do not use for executable files!
    # Note2:
    #    - Uses 'mime' bindings, so you may need to use
    #      e.g. a file manager to make proper file bindings.

    if [ -x /usr/bin/exo-open ] ; then
        echo "exo-open $@" >&2
        setsid exo-open "$@" >& /dev/null
        return
    fi
    if [ -x /usr/bin/xdg-open ] ; then
        for file in "$@" ; do
            echo "xdg-open $file" >&2
            setsid xdg-open "$file" >& /dev/null
        done
        return
    fi

    echo "$FUNCNAME: package 'xdg-utils' or 'exo' is required." >&2
}

#------------------------------------------------------------

## Aliases for the functions above.
## Uncomment an alias if you want to use it.
##

alias ef='_open_files_for_editing'     # 'ef' opens given file(s) for editing
# alias pacdiff=eos-pacdiff
################################################################################


################################################################################
## koke 
DOCUMENTS=$(xdg-user-dir DOCUMENTS)

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias grep='grep --color'
alias vi='nvim'
alias we='cat ~/clases/weekTasks.txt'
alias weed='vi ~/clases/weekTasks.txt'
alias t='todo.sh -t -d /home/koke/.config/todo/config'
alias icat='kitty +kitten icat --align=left'
alias wtr='curl wttr.in/temuco?lang=es'
alias viconf='vi -c "cd ~/.config/nvim" ~/.config/nvim'

calendar() {
    setsid  libreoffice /home/koke/ufro/semestre/22-2/calendario.ods
}

sched() {
    icat $DOCUMENTS/horarios/22-2.png
}

who() {
    icat $DOCUMENTS/horarios/22-2-quienChuchaEstaEnClases-2022-08-30.jpg
}

export CHROME_EXECUTABLE=/usr/bin/chromium

eval "$(starship init bash)"
