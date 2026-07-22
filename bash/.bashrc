[[ $- != *i* ]] && return
bind "set completion-ignore-case on"

export PATH="$PATH:$HOME/.config/emacs/bin"

set -o vi
shopt -s checkwinsize
HISTSIZE=5000

HISTFILESIZE=10000
HISTCONTROL=ignoreboth
PS1='\[\e[1;36m\]\u@\h\[\e[0m\]:\[\e[1;36m\]\w\[\e[0m\]\n\$ ' 
PS2='>>>'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias less='less -R' 
alias ll='ls -lh'   
alias la='ls -A'   
alias l='ls -CF'  

alias nv="nvim"
alias v="vim"
alias snv="sudo nvim"

alias s="source ~/.bashrc"  
alias sb="nvim ~/.bashrc"  

alias stc="nvim ~/.config/niri/config.kdl"
alias cdh="cd ~/.config/hypr"
alias cds="cd ~/.config/niri/scripts"

alias ff="fastfetch"

alias dc="cd ~/Documents"
alias dw="cd ~/Downloads"
alias code="cd ~/Documents/code"
alias alg="cd ~/Documents/code/alg"
alias uni="cd ~/Documents/university"
alias lec="cd ~/Documents/university/lectures"
alias as="cd ~/Documents/university/Assignments"
alias sl="cd ~/Documents/university/Syllabys"
alias cmp="g++ -o exec"

alias ps="paru -S"  
alias pu="paru -Syu"
alias pr="paru -Rns"

alias rm='rm -rf'

alias ga='git add'
alias gc='git commit -v'
alias gca='git commit -v --amend'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gs='git status -sb' 
alias gd='git diff'
alias gds='git diff --staged'
alias gl='git log --oneline --decorate --all --graph'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpl='git pull'
alias gb='git branch'

alias cpwd='pwd | tr -d "\n" | xclip -selection clipboard'
alias serve='python3 -m http.server' 
alias zl="zellij"
alias zlr="zellij -l regular"
alias zlc="zellij -l coding"
alias zlm="zellij -l monitor"

alias his='history | grep '
alias lls='ls -l --color=auto'
alias em="emacs -nw"
