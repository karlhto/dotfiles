#!/usr/bin/env bash

# User defined settings, ish
XRANDR="xrandr"
CMD="${XRANDR}"
COMPOSITOR="picom"
COMPOSITOR_PID=$(pidof -x $COMPOSITOR)
BAR="polybar"
# Monitor which is part of the lid
LID="eDP"

HOSTNAME=$(hostname)

# Fetching connected screens
declare -A VOUTS
eval VOUTS=$(${XRANDR}|awk 'BEGIN {printf("(")} /^\S.*connected/{printf("[%s]=%s ", $1, $2)} END{printf(")")}')
# Position for the row feature
declare -A POS
POS=([X]=0 [Y]=0)

find_mode() {
    echo $(${XRANDR} |grep ${1} -A1|awk '{FS="[ x]"} /^\s/{printf("WIDTH=%s\nHEIGHT=%s", $4,$5)}')
}

xrandr_params_for() {
    if [ "${2}" == 'connected' ]
    then
        eval $(find_mode ${1})  #sets ${WIDTH} and ${HEIGHT}
        MODE="${WIDTH}x${HEIGHT}"
        CMD="${CMD} --output ${1} --mode ${MODE} --pos ${POS[X]}x${POS[Y]}"
        POS[X]=$((${POS[X]}+${WIDTH}))
        return 0
    else
        CMD="${CMD} --output ${1} --off"
        return 1
    fi
}

start_compositor() {
    $COMPOSITOR -b
    COMPOSITOR_PID=$(pidof -x $COMPOSITOR)
}

stop_compositor() {
    if [ $COMPOSITOR_PID ]; then
        kill $COMPOSITOR_PID
    fi
}

set_laptop() {
    stop_compositor
    for VOUT in ${!VOUTS[*]}
    do
        if [ "${VOUT}" != "$LID" ]
        then
            $XRANDR --output ${VOUT} --off
        fi
    done
    $XRANDR --output "$LID" --auto
    start_compositor
    refresh_bar
}

refresh_bar() {
    stop_compositor
    killall -q $BAR
    if [ $HOSTNAME == 'krrl' ]; then
        $BAR desktop-left -r &
        $BAR desktop-right -r &
    else
        for VOUT in ${!VOUTS[*]}
        do
            if [ "${VOUTS[${VOUT}]}" == 'connected' ] && \
               [ "$1" != 'dock' -o "${VOUT}" != "$LID" ]; then
                MONITOR="${VOUT}" $BAR laptop -r &
            fi
        done
    fi
    start_compositor
}

set_work() {
    stop_compositor
    $XRANDR \
        --output $LID --primary --mode 1920x1080 --pos 0x0 \
        --output HDMI-A-0 --off \
        --output DisplayPort-0 --off \
        --output DisplayPort-1 --mode 3440x1440 --pos 1920x0 --rotate normal
    feh --bg-fill --no-fehbg --randomize /storage/Wallpapers/
    start_compositor
    refresh_bar
}

set_auto_for_direction() {
    stop_compositor
    for VOUT in ${!VOUTS[*]}
    do
        if [ "${VOUT}" != "$LID" ]
        then
            $XRANDR --output ${VOUT} --auto $1 $LID
        fi
    done
    start_compositor
}

set_auto() {
    $XRANDR --auto
}

set_row() {
    for VOUT in ${!VOUTS[*]}
    do
        xrandr_params_for ${VOUT} ${VOUTS[${VOUT}]}
    done
    set -x
    ${CMD}
    set +x
}

case "$1" in
    (laptop)
        set_laptop
        ;;
    (work)
        set_work
        ;;
    (left)
        set_auto_for_direction --left-of
        ;;
    (right)
        set_auto_for_direction --right-of
        ;;
    (duplicate)
        set_auto
        ;;
    (row)
        set_row
        ;;
    (bars)
        refresh_bar
        ;;
    *)
        echo "Usage: $0 {laptop|work|left|right|duplicate|row}"
        exit 1
        ;;
esac
