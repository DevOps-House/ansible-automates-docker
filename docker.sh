#!/bin/bash
printf "\033[1;31mEnter the number of containers to be launched:\033[0m\n"
read int
docker pull alpine > /dev/null
a=$(docker images |grep -i alpine |awk {'print $3'})
for i in `seq $int` ; do docker run -it -d $a > /dev/null; done
printf "\033[1;31m$int Container's launched: Run 'docker ps' to check the running containers\033[0m\n"
