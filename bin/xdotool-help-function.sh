#!/bin/bash
function swap_to(){
    # swap to chrome
    local name="$@"
    local PID=$( xdotool search --limit 1 --name "${name}" )
    xdotool windowactivate $PID
    xdotool sleep 1
}
