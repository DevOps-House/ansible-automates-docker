#!/bin/bash
clear
printf "\033[1;31mEnter the Image Name(eg: fedora, rhel, alpine):\033[0m\n"
read imagename
printf "\033[1;31mEnter the number of containers to be launched:\033[0m\n"
read int

docker pull $imagename 1> /dev/null 2>&1
returncode=`echo $?`

if [ $returncode -eq 0 ]; then
a=$(docker images |grep -i $imagename |awk {'print $3'})
for i in `seq $int` ; do docker run -it -d $a > /dev/null; done
printf "\033[1;31m$$int Container's launched.\033[0m\n"
docker ps
else
printf "\033[1;31mOops!! $imagename is not available in repository.\033[0m\n"
fi
