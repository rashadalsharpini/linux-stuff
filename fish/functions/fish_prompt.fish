function fish_prompt
    set_color blue #$fish_color_cwd
    echo -n 'λ '(basename $PWD)
    set_color normal
    echo -n ' ) → '
end

