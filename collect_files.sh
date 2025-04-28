#!/bin/bash

input_dir="$1"
output_dir="$2"

kolvo=1

find "$input_dir" -type f | while read papka
do
    name=$(basename "$papka")
    osn="${name%.*}"
    kon="${name##*.}"
    
    if [[ ! -e "$output_dir/$name" ]]
    then
        cp "$papka" "$output_dir/$name"
        $kolvo=0  
        
    else
        newname="${osn}_${kolvo}.$kon"
        cp "$papka" "$output_dir/$newname"
        ((kolvo++))
    fi
done