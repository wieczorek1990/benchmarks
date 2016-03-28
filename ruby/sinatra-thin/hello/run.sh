#!/usr/bin/env bash

bundle exec thin -e production -p 3000 --threaded start > /dev/null 2>&1
