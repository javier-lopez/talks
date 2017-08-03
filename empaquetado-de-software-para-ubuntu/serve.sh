#!/bin/bash
# Starts a basic web server on the port specified.
# ./serve.sh 3000 -> http://localhost:3000
# Copyright 2012 Eric Bidelman <ebidel@gmail.com>

port="${1}"
[ "${#}" -ne "1" ] && port="8000"
[ "$(uname -s)" = "Darwin" ] && open="open" || open="xdg-open"
${open} "http://localhost:${port}/template.html" && python -m SimpleHTTPServer "${port}";
