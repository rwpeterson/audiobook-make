#!/bin/bash

ffmpeg -f concat -safe 0 -i filelist.txt -i cover.jpg -f ffmetadata -i chapters.txt -c:a copy -c:v mjpeg -disposition:v attached_pic -map_metadata 2 output.mp3

echo "Wrote concatenated audio with chapter and cover to output.mp3"
