# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

############################
# custom aliases

# aliases to change to common dirs
alias cv='cd /home/arne/Documents/Application/CV'
alias cl='cd /home/arne/Documents/Application/Cover_Letters/'
alias ncl='cd /home/arne/Documents/Application/Cover_Letters/; lowriter Cover_Letter.ott'
alias appl='cd /home/arne/Documents/Application/'
alias nielsenchuang='cd /home/arne/Documents/Studies/Masterarbeit/Literature; evince nielsenchuang.djvu'
alias werner='cd /home/arne/Documents/PhD/project_werner'
alias poster='cd /home/arne/Documents/PhD/INFO0101/poster/'
alias lecture='cd ~/Documents/PhD/Lectures_given/14_Prob_Inf/'
alias infsec='cd /home/arne/Documents/PhD/Lectures_taken/Information_Security'
alias prob='cd /home/arne/Documents/PhD/Lectures_given/14_Prob_Inf'
alias qm='cd /home/arne/Documents/PhD/Coding/cpp_classes/quantum'
alias solver='cd /home/arne/Documents/PhD/Coding/cpp_classes/solvers'
alias opt='cd /home/arne/Documents/PhD/Coding/cpp_classes/optimization_problems'
alias gen='cd /home/arne/Documents/PhD/Coding/cpp_classes/general'
alias cp3p='cd /home/arne/Documents/PhD/Coding/finite-speed-communication'
alias dm='cd /home/arne/Documents/PhD/Lectures_given/15_Discr_Math/Script'

# Git aliases
alias gst='git status'
alias ga='git add --all'
alias gc='git commit -m '
alias gp='git push'
alias comp='bash compile.sh'
alias br='cd /var/www/html/cornaredo_routes/'

#alias pres='cd /home/arne/Documents/Studies/Masterarbeit/Presentation_USI/; vim presentation.tex'

############################
# custom functions
shrinkPDF ()
{
  gs          \
  -q -dNOPAUSE -dBATCH -dSAFER    \
  -sDEVICE=pdfwrite     \
  -dCompatibilityLevel=1.3    \
  -dPDFSETTINGS=/screen     \
  -dEmbedAllFonts=true      \
  -dSubsetFonts=true      \
  -dColorImageDownsampleType=/Bicubic \
  -dColorImageResolution=72   \
  -dGrayImageDownsampleType=/Bicubic  \
  -dGrayImageResolution=72    \
  -dMonoImageDownsampleType=/Bicubic  \
  -dMonoImageResolution=72    \
  -sOutputFile="$2"     \
  "$1"
}

############################

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Gurobi settings
export GUROBI_HOME="/opt/gurobi604/linux64"
export PATH="${PATH}:${GUROBI_HOME}/bin"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${GUROBI_HOME}/lib"
export LD_LIBRARY_PATH="${GUROBI_HOME}/lib"

export PATH="${PATH}:/usr/local/texlive/2015/bin/x86_64-linux"
