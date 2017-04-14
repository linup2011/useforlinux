#!/bin/bash
user=$1
remote=`w -i | grep -v ' :0' | awk '/screen -x irc/ {print $3}'`
[ -z $remote ] && remote=`w -i | grep -v ' :0' | awk '/sshd/ {print $3}'`
[ -z $remote ] && remote=`w -i | grep -v ' :0' | awk '/irssi/ {print $3}'`
[ -n $remote ] && con="ssh -o LogLevel=quiet -o StrictHostKeyChecking=no $user@$remote" || con=''
echo "$con"
