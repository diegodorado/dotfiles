#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
CAPTURE_DIR=~/Music/capture
CAPTURE_PORT="system:capture*"
RUNNING="$(jack_control status | grep started)"
CAPTURING="$(pgrep jack_capture)"

start_jack(){
  if [ $RUNNING ]; then exit 2; fi
  if pulseaudio --check ; then pulseaudio --kill; fi && jack_control start && rm -f $PLAYING;
}

exit_jack(){
  if [ ! $RUNNING ]; then exit 2; fi
  stop # in case it was recording
  jack_control stop
  # if pulseaudio --check ; then pulseaudio -D; fi 
}

play(){
  if [ ! $RUNNING ]; then exit 2; fi
  echo "locate 0" | jack_transport
  echo "play" | jack_transport
}

stop(){
  if [ ! $RUNNING ]; then exit 2; fi
  echo 'stop' | jack_transport 
}

arm(){
  if [ ! $RUNNING ]; then exit 2; fi
  mkdir -p $CAPTURE_DIR
  cd $CAPTURE_DIR
  # restart location, in case already playing
  echo "locate 0" | jack_transport
  jack_capture --daemon --jack-transport --port "${CAPTURE_PORT}"
}

unarm(){
  if [ ! $RUNNING ]; then exit 2; fi
  killall jack_capture
}

toggle(){
  if [ $RUNNING ]; then exit_jack; else start_jack; fi
}

toggle_play(){
  echo "locate 0" | jack_transport
  echo "toggle" | jack_transport
}

toggle_arm(){
  if [ $CAPTURING ]; then unarm; else arm; fi
}

case "$1" in
  "start")
    start_jack;;
  "exit")
    exit_jack;;
  "play")
    play;;
  "stop")
    stop;;
  "arm")
    arm;;
  "unarm")
    unarm;;
  "toggle")
    toggle;;
  "toggle_play")
    toggle_play;;
  "toggle_arm")
    toggle_arm;;
  *)
    echo "You have failed to specify what to do correctly."
    exit 1
    ;;
esac

