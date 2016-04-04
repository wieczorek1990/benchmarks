#!/usr/bin/env bash

####
# Constants
host=localhost
port=3000
url=http://$host:$port
####

source ./config.sh

function test {
  wrk -c $connections -d $duration -t $threads $url
}

function run {
  directory=$1

  cd $directory
  ./run.sh &
  while ! curl $url > /dev/null 2>&1; do : ; done
  test
  kill_blocker
  cd - &> /dev/null
}

function kill_blocker {
  pid=`netstat -tulpn 2>/dev/null | grep :$port | tr -s ' ' | cut -f7 -d' ' | cut -f1 -d/`
  if [ -n "$pid" ]
  then
    kill -9 $pid
    while :
    do
      kill -0 $pid
      [[ $? -ne 0 ]] || break
    done
  fi
}

kill_blocker
for language in ${!configurations[@]}
do
  frameworks=${configurations[$language]}
  for framework in $frameworks
  do
    for app_name in $app_names
    do
      echo "Testing: $language $framework $app_name"
      run $language/$framework/$app_name/
      echo
    done
  done
done
