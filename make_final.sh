#!/bin/bash

ffmpeg -f concat -safe 0 -i filelist.txt -i cover.jpg -i chapters.txt \
-map 0:a -map 1 -map_metadata 2 \
-c:a copy -c:v mjpeg \
-disposition:v attached_pic \
-id3v2_version 3 \
output.mp3

echo "Wrote concatenated audio with chapter and cover to output.mp3"
