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
        newname="$papka"
        papka_kolvo["$osn"]=0  
        
    else
        ((papka_kolvo["$osn"]++))
        if [["$osn" == "$kon"]]
        then
            newname="${osn}$((${papka_kolvo["$osn"]}+1))"
        else
            newname="${osn}$((${papka_kolvo["$osn"]}+1)).$kon"
        fi
        
    fi
    cp "$papka" "$output_dir/$newname"
done