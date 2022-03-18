#!/bin/bash

if [[ $(ps h -C ffmpeg | wc -l) != 0 ]]
then
	killall ffmpeg
	exit 0
fi

killall ffmpeg
TMPFILE="$(mktemp -t screencast-XXXXXXX).mkv"
trap "rm -f '$TMPFILE'" EXIT

OUTPUT="$HOME/Pictures/Screencasts/$(dmenu -p Filename <&-)"

read -r X Y W H G ID < <(slop -f "%x %y %w %h %g %i")
ffmpeg -f x11grab -s "$W"x"$H" -i :0.0+$X,$Y "$TMPFILE"

notify-send 'generating palette'
ffmpeg -y -i "$TMPFILE"  -vf fps=10,palettegen /tmp/palette.png
notify-send 'generating gif'
ffmpeg -i "$TMPFILE" -i /tmp/palette.png -filter_complex "paletteuse" $OUTPUT.gif
mv $TMPFILE $OUTPUT.mkv

notify-send "size $(du -h $OUTPUT.gif | awk '{print $1}')"

eog $OUTPUT.gif

