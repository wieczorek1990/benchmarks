#!/usr/bin/env bash

source ./config.sh

function install {
  directory=$1

  cd $directory
  ./install.sh
  cd - &> /dev/null
}

for language in ${!configurations[@]}
do
  frameworks=${configurations[$language]}
  for framework in $frameworks
  do
    for app_name in $app_names
    do
      echo "Installing: $language $framework $app_name"
      install $language/$framework/$app_name/
      echo
    done
  done
done
