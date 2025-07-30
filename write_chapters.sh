#!/bin/bash

# Read chapter titles from file
readarray -t titles < titles.txt

# Initialize chapters file
echo ";FFMETADATA1" > chapters.txt

duration=0
chapter_index=0

# Read filelist.txt line by line
while IFS= read -r line; do
    # Extract filename from "file 'filename'" format
    if [[ $line =~ ^file\ \'(.*)\'$ ]]; then
        filename="${BASH_REMATCH[1]}"
        
        # Get duration of this file
        length=$(ffprobe -v quiet -show_entries format=duration -of csv=p=0 "$filename")
        
        # Add chapter metadata
        echo "[CHAPTER]" >> chapters.txt
        echo "TIMEBASE=1/1000" >> chapters.txt
        echo "START=$(printf "%.0f" $(echo "$duration * 1000" | bc))" >> chapters.txt
        duration=$(echo "$duration + $length" | bc)
        echo "END=$(printf "%.0f" $(echo "$duration * 1000" | bc))" >> chapters.txt
        
        # Use custom title if available, otherwise use filename without extension
        if [[ $chapter_index -lt ${#titles[@]} ]]; then
            echo "title=${titles[$chapter_index]}" >> chapters.txt
        else
            # Fallback to filename without extension
            basename_no_ext=$(basename "$filename" .mp3)
            echo "title=$basename_no_ext" >> chapters.txt
        fi
        
        ((chapter_index++))
    fi
done < filelist.txt

echo "Generated chapters.txt with $chapter_index chapters"
