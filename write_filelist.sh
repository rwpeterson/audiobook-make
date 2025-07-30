#!/bin/bash

for f in *.mp3; do echo "file '${f}'" >> filelist.txt; done
echo "Wrote all *.mp3 files to filelist.txt. Edit file and review order."
