#!/bin/sh
set -e

_die() {
    printf "%s\\n" "${@}" >&2
    exit 1
}

[ -n "${TMUX}" ] && _die "tmux is already running, exiting..."

SESSION="iac-launcher"
tmux -2 new-session -d -s "${SESSION}"

#Setup a new window
tmux split-window -h
tmux select-pane -t 0
tmux send-keys "gotty -c docker:docker -w tmux new -A -s iac" C-m
tmux select-pane -t 1
tmux send-keys "ngrok http 8080" C-m

#Attach to session
tmux -2 attach-session -t "${SESSION}"
