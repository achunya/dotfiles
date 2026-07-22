### INTERACTIVE SESSION CHECK
if status is-interactive

    # Vi Mode
    set -g fish_key_bindings fish_vi_key_bindings

    # Path
    fish_add_path "$HOME/.config/emacs/bin"

    ### PROMPT CONFIGURATION
    # Fish defines prompts via functions rather than PS1 strings
    function fish_prompt
        set_color cyan
        echo -n (whoami)"@"(prompt_hostname)
        set_color normal
        echo -n ":"
        set_color cyan
        echo -n (prompt_pwd)
        set_color normal
        echo -e "\n\$ "
    end

    # Equivalent to PS2
    function fish_right_prompt
        # Fish doesn't use PS2 the same way, but you can put info here 
        # or leave it blank.
    end

    ### ALIASES
    # Navigation & General
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

    # Config Editing (Updated for Fish)
    alias s="source ~/.config/fish/config.fish"  
    alias sf="nvim ~/.config/fish/config.fish"  

    alias sb="nvim ~/.bashrc"
    alias stc="nvim ~/.config/niri/config.kdl"
    alias cdh="cd ~/.config/hypr"
    alias cds="cd ~/.config/niri/scripts"

    alias ff="fastfetch"

    # Directories
    alias dc="cd ~/Documents"
    alias dw="cd ~/Downloads"
    alias code="cd ~/Documents/code"
    alias alg="cd ~/Documents/code/alg"
    alias uni="cd ~/Documents/university"
    alias lec="cd ~/Documents/university/lectures"
    alias as="cd ~/Documents/university/Assignments"
    alias sl="cd ~/Documents/university/Syllabys"
    alias cmp="g++ -o exec"

    # Package Manager (Paru)
    alias ps="paru -S"  
    alias pu="paru -Syu"
    alias pr="paru -Rns"

    alias rm='rm -rf'

    # Git
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

    # Utilities
    alias cpwd='pwd | tr -d "\n" | xclip -selection clipboard'
    alias serve='python3 -m http.server' 
    alias zl="zellij"
    alias zlr="zellij -l regular"
    alias zlc="zellij -l coding"
    alias zlm="zellij -l monitor"
    alias ba="bash "

    alias his='history | grep '
    alias lls='ls -l --color=auto'
    alias em="emacs -nw"

end
