#!/bin/bash
TTY="$1"
SESSION=$USER

tmux -2 new-session -d -s $SESSION

# cat from the RF device
tmux new-window -t $SESSION:1
tmux split-window -h
tmux select-pane -t 0
tmux send-keys "cat $TTY" C-m

#Send commands to RF device
tmux select-pane -t 1
tmux send-keys "./rf_send.sh $TTY" C-m
tmux -2 attach-session -t $SESSION
