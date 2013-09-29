# -*- coding: utf-8 -*-

import subprocess

from . import Status

status = Status(standalone=True)

# Displays clock like this:
# Tue 30 Jul 11:59:46 PM KW31
#                          ^-- calendar week
status.register("clock", format="%a %-d %b %X W%V")

# Shows your CPU temperature, if you have a Intel CPU
status.register("temp", format="{temp:.0f}°C")

# Shows pulseaudio default sink volume
#
# Note: requires libpulseaudio from PyPI
status.register(
    "pulseaudio",
    format="♪{volume}",
)

# Shows mpd status
# Format:
# Cloud connected ▶ Reroute to Remain
status.register(
    "mpd",
    format="{title} {status} {album}",
    status={
        "pause": "▷",
        "play": "▶",
        "stop": "◾",
    },
)

status.run()
