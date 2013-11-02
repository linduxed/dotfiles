# -*- coding: utf-8 -*-

import subprocess

from . import Status

status = Status(standalone=True)

status.register("clock", format="%a %-d %b %X W%V")

status.register("battery",
    format="{status} {remaining:%E%hh:%Mm}",
    alert=True,
    alert_percentage=10,
    status={
        "DIS":  "↓",
        "CHR":  "↑",
        "FULL": "=",
    },)

status.register("temp", format="{temp:.0f}°C")

status.register(
    "pulseaudio",
    format="♪{volume}",
)

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
