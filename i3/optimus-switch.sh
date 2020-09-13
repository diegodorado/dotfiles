#!/bin/bash

if [ "`optimus-manager --print-mode | grep intel`" ];  then optimus-manager --switch nvidia --no-confirm; else optimus-manager --switch intel --no-confirm; fi
