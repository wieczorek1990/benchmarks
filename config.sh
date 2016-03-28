#!/usr/bin/env bash

####
# Config
app_names="hello"
declare -A configurations=(
  ["crystal"]="kemal"
  ["python"]="flask-uwsgi"
  ["ruby"]="rails-puma rails-api-puma sinatra-puma sinatra-thin"
  ["rust"]="iron nickel"
)

connections=256
duration=4
threads=4

startup_seconds=4
shutdown_seconds=2
####
