#!/usr/bin/env bash

####
# Constants
host=localhost
port=3000
####

source ./config.sh

function test {
  wrk -c $connections -d $duration -t $threads http://$host:$port
}

function run {
  directory=$1

  cd $directory
  ./run.sh &
  sleep $startup_seconds
  test
  kill_blocker
  sleep $shutdown_seconds
  cd - &> /dev/null
}

function kill_blocker {
  last_pid=`netstat -tulpn 2>/dev/null | grep :$port | tr -s ' ' | cut -f7 -d' ' | cut -f1 -d/`
  if [ -n "$last_pid" ]
  then
    kill -9 $last_pid
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
