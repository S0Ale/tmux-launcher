#!/bin/bash

SESH="test-session"

tmux has-session -t $SESH 2>/dev/null

if [ $? != 0 ]; then
	tmux new-session -d -s $SESH -n "test"
	tmux send-keys -t $SESH:test "python" C-m
fi

tmux attach-session -t $SESH
