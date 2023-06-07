#!/bin/bash
keywords=("vim" "cd")

[[ ! -d "$HOME/.vim" ]] \
    && mkdir "$HOME"/.vim \
    && printf "mkdir: $HOME/.vim\n"

# clear the file
for keyword in ${keywords[@]}; do
    grep "$keyword\ " ~/.bash_aliases \
        | sed \
            -e 's/alias\ /map <leader>/g' \
            -e 's/=/\ :e/g' \
            -e "s/\"$keyword//g" \
            -e 's/\"/<CR>/g'
done

exit 0
