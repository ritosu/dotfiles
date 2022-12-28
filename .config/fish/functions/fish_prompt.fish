function fish_prompt --description 'Write out the prompt'
    echo -n -s (set_color -b blue) (set_color black) "$USER" ' ' 
    echo -n -s (set_color -b brblue) (set_color black) (prompt_pwd) ' ' (set_color normal) 
    echo -n -s (fish_vcs_prompt) $normal " "$prompt_status $suffix " "
end
