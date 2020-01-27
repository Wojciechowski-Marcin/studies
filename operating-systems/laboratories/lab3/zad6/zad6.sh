#!/bin/bash

ps -elF | while read line; do
    uid=$(echo $line | cut -d " " -f3)
    if [ $uid == $(whoami) ]; then
        echo $line
    fi
done