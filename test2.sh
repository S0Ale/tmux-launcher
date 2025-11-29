#!/bin/bash

SESH="test-session-split"

tmux has-session -t $SESH 2>/dev/null

if [ $? != 0 ]; then
	tmux new-session -d -s $SESH -n "test"
	tmux send-keys -t $SESH:test "python" C-m
	tmux splitw -h
	tmux splitw -v
fi

tmux attach-session -t $SESH
