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
            newname="${osn}_${papka_kolvo["$osn"]}"
        else
            newname="${osn}_${papka_kolvo["$osn"]}.$kon"
        fi
        
    fi
    cp "$papka" "$output_dir/$newname"
done