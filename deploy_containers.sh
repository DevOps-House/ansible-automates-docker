#!/bin/bash
clear
printf "\033[1;31mEnter the Image name(Eg: rhel, fedora, ubuntu, etc):\033[0m\n"
read imagename
printf "\033[1;31mNumber of containers to be launched:\033[0m\n"
read int

docker pull $imagename 1> /dev/null 2>&1
returncode=`echo $?`

if [ $returncode -eq 0 ]; then
a=$(docker images |grep -i $imagename |awk {'print $3'})
for i in `seq $int` ; do docker run -it -d $a bash > /dev/null; done
printf "\033[1;31mLaunched $int containers. Run 'docker ps' to see the running containers.\033[0m\n"
else
printf "\033[1;31mERROR: $imagename is not available in docker hub repository.\033[0m\n"
fi

