# Audiobook preparation with `ffmpeg`

This is a set of five scripts that takes your indiviual chapter mp3s and a cover jpg, and combines them into a finished, single mp3 file.

## Instructions

1. Place your media files in the directory with these scripts
  - Chapters should be files ending in `.mp3`. If they are already alphabetically ordered, that simplifies things, but we can fix the order later.
  - The cover image should be named `cover.jpg`

2. Run `./write_filelist.sh` to generate `filelist.txt`. This appends to the file, so to start clean, you need to `rm filelist.txt` before running the script again.

3. Edit `filelist.txt`. The lines are alphabetical by filename, but for example the front and back matter may need to be moved to the correct line. Chapters are ordered by line order in this file.

4. Run `./write_titles.sh` to generate `titles.txt`. Edit this to format chapter title names but **do not reorder lines**. Start over from the beginning if reordering is needed.

5. Run `./write_chapters.sh` to write `chapters.txt`. This is machine-readable and doesn't need to be edited.

6. Run `./make_final.sh` to produce `output.mp3`

7. Confirm in media player, e.g. `mpv output.mp3`. PgUp/PgDown seek to chapters.

8. If you wish to redo from the beginning, run `./cleanup.sh`. This will delete all the txt files you created and edited.
