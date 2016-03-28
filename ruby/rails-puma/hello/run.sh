#!/usr/bin/env bash

SECRET_KEY_BASE=secret bundle exec puma -e production -p 3000 -t 0:16 > /dev/null 2>&1
