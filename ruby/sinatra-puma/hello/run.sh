#!/usr/bin/env bash

bundle exec puma -e production -p 3000 > /dev/null 2>&1
