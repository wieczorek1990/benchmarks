#!/usr/bin/env bash

####
# Config
app_names="hello"
declare -A configurations=(
  ["crystal"]="kemal"
  ["python"]="flask-uwsgi"
  ["ruby"]="rails-puma rails-api-puma sinatra-puma sinatra-thin"
)

connections=256
duration=16
threads=4

startup_seconds=16
shutdown_seconds=8
####
