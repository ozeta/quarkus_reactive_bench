#!/bin/bash
BAR='########################################'   # this is full bar, e.g. 20 chars

function progress() {
    echo "[INFO] waiting for docker to work"
    for i in $(seq 1 $1); do
        echo -ne "\r${BAR:0:$i}" # print $i chars of $BAR from 0 position
        sleep 1                 # wait 100ms between "frames"
    done
    echo "\n[INFO] done"
}
