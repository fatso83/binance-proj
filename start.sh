#!/bin/sh

HEALTH_FILE=/tmp/health.txt

health(){
    [ "$(cat $HEALTH_FILE)" == "OK" ]
}

kill_script(){
    if kill -0 $PID; then
        printf "Killing script\n"
        kill $PID
    fi
}

start_script(){
    python binance.py &
    PID=$!
    sleep 10 # for startup slowness
}

echo "" > $HEALTH_FILE
while true; do

    if ! health; then
        kill_script 
        start_script
    else
        sleep 1
    fi

done

