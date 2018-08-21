#!/bin/sh
set -e

_die() {
    printf "%s\\n" "${@}" >&2
    exit 1
}

[ -n "${TMUX}" ] && _die "tmux is already running, exiting..."

SESSION="iac"
SESSION_LAUNCHER="${SESSION}-launcher"

#tmux launcher session
tmux -2 new-session -d -s "${SESSION_LAUNCHER}"
tmux split-window -h
tmux select-pane -t 0
tmux send-keys "gotty -c docker:docker -w tmux new -A -s ${SESSION}" C-m
tmux select-pane -t 1
tmux send-keys "ngrok http 8080" C-m
x-terminal-emulator -e "${SHELL}" -c "tmux -2 attach-session -t ${SESSION_LAUNCHER}" &

#tmux demo session
x-terminal-emulator -e "${SHELL}" -c "tmux -2 new -A -s ${SESSION}" & sleep 0.5
tmux send-keys -t "${SESSION}" "vim vlide.md" C-m; sleep 0.3
tmux send-keys -t "${SESSION}" ":Vlide" C-m;       sleep 0.3
tmux split-window -h
tmux select-pane -t 0
tmux resize-pane -R 15
