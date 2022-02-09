#!/bin/bash

# capture SIGTERM signal, print message and exit
trap "echo shutting down && exit;" SIGTERM

if [[ $1 == "--link" || $1 == "-l" ]] ; then 
    echo "YouTube link: https://www.youtube.com/watch?v=dQw4w9WgXcQ&ab_channel=RickAstley"  
fi

for i in {-1..102} 
do
    nv="never gonna" 
    if [[ $(( ("$i" + 1) % 6))  == "0" ]] ; then echo "$nv give you up" ; fi
    if [[ $(( ("$i" + 1) % 6)) == "1" ]] ; then echo "$nv let you down" ; fi
    if [[ $(( ("$i" + 1) % 6)) == "2" ]] ; then echo "$nv run around and desert you" ; fi
    if [[ $(( ("$i" + 1) % 6)) == "3" ]] ; then echo "$nv make you cry" ; fi
    if [[ $(( ("$i" + 1) % 6)) == "4" ]] ; then echo "$nv say goodbye" ; fi
    if [[ $(( ("$i" + 1) % 6)) == "5" ]] ; then echo "$nv tell a lie and hurt you" ; fi
    sleep 2
done

exec "$@"