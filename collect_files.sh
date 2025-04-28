#!/bin/bash

input_dir="$1"
output_dir="$2"

declare -A papka_kolvo

find "$input_dir" -type f | while read papka
do
    name=$(basename "$papka")
    osn="${name%.*}"
    kon="${name##*.}"
    
    if [[ ! -e "$output_dir/$name" ]]
    then
        cp "$papka" "$output_dir/$name"
        papka_kolvo["$osn"]=0  
    else
        newname="${osn}$((${papka_kolvo["$osn"]}+1)).$kon"
        cp "$papka" "$output_dir/$newname"
        ((papka_kolvo["$osn"]++))
    fi
    
done