#!/bin/bash 
command=$1;shift
target1=$1;shift
target2=$1

path=/home/ubuntu/Downloads/s3/

if [ -n $command -a -z "$target1" -a -z "$target2" ]; then
    ssh aws aws s3 $command
    
elif [ -n $command -a -n $target1 -a -z "$target2" ]; then 
    ssh aws aws s3 $command $target1
    
elif [ -n $command -a -n $target1 -a -n $target2 ]; then
    scp $target1 aws:$path
    ssh aws aws s3 $command $path/$target1 $target2  

fi
