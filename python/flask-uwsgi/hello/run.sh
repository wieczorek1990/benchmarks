#!/usr/bin/env bash

uwsgi --wsgi-file hello.py --http :3000 --callable app -T -L > /dev/null 2>&1
