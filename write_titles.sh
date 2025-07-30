#!/bin/bash

# Convert filelist.txt to titles.txt for editing
sed "s/^file '//;s/\.mp3'$//" filelist.txt > titles.txt

echo "Created titles.txt from filelist.txt"
echo "Edit titles.txt with your desired chapter names, then run your main script"
