#!/bin/bash
## lf config
map . set hidden! 
map <esc> quit
#map <enter> open
map F setfilter
map c+F filter
map m set mouse!
map a glob-select *
map a glob-unselect *
map z unselect *
map <tab> :push :<tab> 
map M :push %mkdir<space>
map <delete> delete
map d delete
map <?> maps
map <pgdn> half-down
map <pgup> half-up
# interpreter for shell commands
#set previewer /bin/glow
set shell bash
set info time:size
#set drawbox
# set '-eu' options for shell commands
# These options are used to have safer shell commands. Option '-e' is used to
# exit on error and option '-u' is used to give error for unset variables.
# Option '-f' disables pathname expansion which can be useful when $f, $fs, and
# $fx variables contain names with '*' or '?' characters. However, this option
# is used selectively within individual commands as it can be limiting at
# times.
#set shellopts '-eu'
# set internal field separator (IFS) to "\n" for shell commands
# This is useful to automatically split file names in $fs and $fx properly
# since default file separator used in these variables (i.e. 'filesep' option)
# is newline. You need to consider the values of these options and create your
# commands accordingly.
#set ifs "\n"

# leave some space at the top and the bottom of the screen
set scrolloff 10

# Use the `dim` attribute instead of underline for the cursor in the preview pane
set cursorpreviewfmt "\033[7;2m"

# use enter for shell commands
map <enter> shell

# show the result of execution of previous commands
map 1 !true
# execute current file (must be executable)
map x $$f
map X !$f
# dedicated keys for file opener actions
#map <enter> open
map o $mimeopen --ask $f
# define a custom 'open' command
# This command is called when current file is not a directory. You may want to
# use either file extensions and/or mime types here. Below uses an editor for
# text files and a file opener for the rest.
cmd open &{{
case $(file --mime-type -Lb $f) in
text/*) lf -remote "send $id \$$EDITOR \$fx";;
*) for f in $fx; do $OPENER $f > /dev/null 2> /dev/null & done;;
esac
}}

# mkdir command. See wiki if you want it to select created dir
#map h :push :<tab> 
map h :maps 
map s :search 
#map M :push %mkdir<space>
# define a custom 'rename' command without prompt for overwrite
# cmd rename %[ -e $1 ] && printf "file exists" || mv $f $1
# map r push :rename<space>

# make sure trash folder exists
# %mkdir -p ~/.trash
# move current file or selected files to trash folder
# (also see 'man mv' for backup/overwrite options)
cmd trash %set -f; mv $fx ~/.trash
# define a custom 'delete' command
# cmd delete ${{
#     set -f
#     printf "$fx\n"
#     printf "delete?[y/n]"
#     read ans
#     [ "$ans" = "y" ] && rm -rf $fx
# }}

# use '<delete>' key for either 'trash' or 'delete' command
# map <delete> trash
# map <delete> delete

# extract the current file with the right command
# (xkcd link: https://xkcd.com/1168/)
cmd extract ${{
    set -f
    case $f in
        *.tar.bz|*.tar.bz2|*.tbz|*.tbz2) tar xjvf $f;;
        *.tar.gz|*.tgz) tar xzvf $f;;
        *.tar.xz|*.txz) tar xJvf $f;;
        *.zip) unzip $f;;
        *.rar) unrar x $f;;
        *.7z) 7z x $f;;
    esac
}}

# compress current file or selected files with tar and gunzip
cmd tar ${{
    set -f
    mkdir $1
    cp -r $fx $1
    tar czf $1.tar.gz $1
    rm -rf $1
}}

# compress current file or selected files with zip
cmd zip ${{
    set -f
    mkdir $1
    cp -r $fx $1
    zip -r $1.zip $1
    rm -rf $1
}}




##
##


# Main options
set icons
set period 1
#set relativenumber
#set number
set hidden!
set hiddenfiles ".*:*.aux:*.log:*.bbl:*.bcf:*.blg:*.run.xml"
set cleaner '~/.config/lf/cleaner'
#set previewer 'chafa'
set previewer '~/.config/lf/previewer'
# set promptfmt "
# \033[48;2;35;38;39;38;2;28;220;156m  
# \033[38;2;35;38;39;48;2;202;31;31m
# \033[38;2;202;31;31;48;2;40;47;62m
# \033[38;2;255;255;255m %w 
# \033[38;2;40;47;62;48;2;58;67;89m
# \033[38;2;255;255;255m %f 
# \033[;38;2;58;67;89;49m\033[m"
set incsearch
set incfilter
#set globsearch on
set ratios 2:3:4 # 2:3:7:7
set truncatechar "…"
set waitmsg "\033[1;31m⏎\033[m"
set timefmt "02/01/2006 15:04:05 "
set infotimefmtnew '02/01 15:04'
set infotimefmtold '02/01/06'
set errorfmt "\033[1;31m"
set numberfmt "\033[38;2;75;87;116m"
set dircounts
set tabstop 4
set scrolloff 5
set wrapscroll
set shellopts '-eu'
set ifs "\n"
set shell "bash"
set ruler 'df:acc:progress:selection:filter:ind'
set cursorpreviewfmt "\033[7m"

source '~/.config/lf/opener'

%test $LF_LEVEL -eq 1 || >&2 printf "Warning: You're in a nested lf instance!"
