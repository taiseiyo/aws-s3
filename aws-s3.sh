#!/bin/bash 
command=$1
target1=$2
target2=$3

path=/home/ubuntu/Downloads/s3/

if [ -n $1 -a -z $2 -a -z $3 ] ; then
    ssh aws aws s3 $command
    
elif [ -n $1 -a -n $2 -a -z $3 ] ;then 
    ssh aws aws s3 $command $target1
    
elif [ -n $1 -a -n $2 -a -n $3 ] ;then
    scp $target1 aws:$path
    ssh aws aws s3 $command $path/$target1 $target2  

fi
