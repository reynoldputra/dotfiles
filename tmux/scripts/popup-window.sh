#!/usr/bin/env bash

POPUP_SESSION_NAME="scratch"
DIR="${1:-}"

if [ "$(tmux display-message -p -F "#{session_name}")" = "$POPUP_SESSION_NAME" ];then
    tmux detach-client
    exit 0
fi

if [ -z "$DIR" ]; then
    tmux popup -E -h '80%' -w '80%' "tmux attach -t $POPUP_SESSION_NAME || tmux new -s $POPUP_SESSION_NAME"
else
    tmux popup -E -h '80%' -w '80%' "tmux attach -t $POPUP_SESSION_NAME || tmux new -s $POPUP_SESSION_NAME"
fi
