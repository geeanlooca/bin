#!/bin/bash

BREAKSTART=~/bin/breakstart.ogg
BREAKEND=~/bin/breakend.ogg
START=~/bin/start.ogg

WORKDURATION=1500
BREAKDURATION=300
LONGBREAK=1200

notify-send -i ~/bin/pomodoro.png "Pomodoro session started" "Try and work for 25 minutes straight"; paplay $START ; sleep $WORKDURATION
notify-send -i ~/bin/pomodoro.png "Break" "Stop working for 5 minutes"; paplay $BREAKSTART ; sleep $BREAKDURATION


notify-send -i ~/bin/pomodoro.png "Back to work!" "Try and work for 25 minutes straight"; paplay $START ; sleep $WORKDURATION
notify-send -i ~/bin/pomodoro.png "Break" "Stop working for 5 minutes"; paplay $BREAKSTART ; sleep $BREAKDURATION


notify-send -i ~/bin/pomodoro.png "Back to work!" "Try and work for 25 minutes straight"; paplay $START ; sleep $WORKDURATION
notify-send -i ~/bin/pomodoro.png "Break" "Stop working for 5 minutes"; paplay $BREAKSTART ; sleep $BREAKDURATION


notify-send -i ~/bin/pomodoro.png "Back to work!" "Try and work for 25 minutes straight"; paplay $START ; sleep $WORKDURATION
notify-send -i ~/bin/pomodoro.png "Long break" "Stop working for 20 minutes"; paplay $BREAKSTART ; sleep $LONGBREAK; 

paplay $BREAKEND &
notify-send -i ~/bin/pomodoro.png "Session finished" "Re-run the pomodoro script to start a new session"; 
