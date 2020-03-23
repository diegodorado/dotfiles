#!/bin/python

import sys
import datetime
import subprocess
# See https://github.com/SpotlightKid/jack-matchmaker/blob/master/jackmatchmaker/jacklib.py
import jacklib

rec_icon = "  "
play_icon = "  "
stop_icon = "  "
result = ""

try:
    p = subprocess.run('jack_control status', shell=True,universal_newlines=True, stdout=subprocess.DEVNULL)
    running = (p.returncode==0)
    p = subprocess.run('pgrep jack_capture', shell=True,universal_newlines=True, stdout=subprocess.DEVNULL)
    capturing = (p.returncode==0)
    if not running:
        result += "ALSA"
    else:
        status = jacklib.jack_status_t()
        client = jacklib.client_open("transport-query", jacklib.JackNoStartServer, status)
        transport_state = jacklib.transport_query(client, None)
        result += "JACK"
        rolling = transport_state == jacklib.JackTransportRolling
        if rolling:
            result += play_icon
            f = jacklib.get_current_transport_frame(client)
            sr = jacklib.get_sample_rate(client)
            result += str(datetime.timedelta(seconds=int(f/sr)))
        else:
            result += stop_icon

        if capturing:
            result += rec_icon

        jacklib.client_close(client)

except Exception as e:
    result += e.message
    #print (e.__doc__)

finally:
    print(result)
