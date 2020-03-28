#!/bin/python
import re
import sys
import subprocess

rec_icon = "  "
play_icon = "  "
stop_icon = "  "
result = ""

try:
    p = subprocess.run('jack_control status', shell=True,universal_newlines=True, stdout=subprocess.DEVNULL)
    running = (p.returncode==0)
    p = subprocess.run('pgrep jack_capture', shell=True,universal_newlines=True, stdout=subprocess.DEVNULL)
    capturing = (p.returncode==0)
    p = subprocess.run("amixer sget Master".split(),universal_newlines=True, stdout=subprocess.PIPE)
    match = re.search(r"(.*Right.*\[)(\w*)(%\].*)",p.stdout, re.DOTALL)
    volume = match.group(2)
    
    if not running:
        result += "ALSA"
    else:
        result += "JACK"

        if capturing:
            result += rec_icon

except Exception as e:
    result += e.message
    #print (e.__doc__)

finally:
    v = int(volume)
    if v > 70:
        result += f'  {volume}% '
    elif v > 40:
        result += f'  {volume}% '
    else:
        result += f'  {volume}% '
    
    print(result)
    

