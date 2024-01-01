function fish_prompt
    set -l git_branch (git branch 2>/dev/null | sed -n '/\* /s///p')
        set_color blue #$fish_color_cwd
        echo -n 'λ '(basename $PWD)
        set_color blue
        echo -n ' ) '
        set_color red
        echo -n "$git_branch "
        set_color blue
        echo '→ '
end


    #    function fish_prompt
    #set_color normal
    # https://stackoverflow.com/questions/24581793/ps1-prompt-in-fish-friendly-interactive-shell-show-git-branch
    #set -l git_branch (git branch 2>/dev/null | sed -n '/\* /s///p')
    #echo -n (whoami)'@'(hostname)':'
    #set_color $fish_color_cwd
    #echo -n (prompt_pwd)
    #set_color normal
    #echo -n '{'
    #set_color purple
    #echo -n "$git_branch"
    #set_color normal
    #echo -n '}'
    #echo -n ' $ '
    #end
