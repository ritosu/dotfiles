function fish_prompt --description 'Write out the prompt'
    echo -n -s (set_color yellow) "$USER" ' ' 
    echo -n -s (set_color ff3300) (prompt_pwd) (set_color normal) 
    echo -n -s (fish_vcs_prompt) $normal " "$prompt_status $suffix " "
end
