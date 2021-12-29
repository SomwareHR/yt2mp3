#!/bin/bash

# Download MP3 from a single video

$URL=$1

if [ $# -eq 0 ]; then
  read -p "URL of a single video: " URL
fi

/path/to/youtube-dl                \
 --format "bestaudio[ext=m4a]/mp4" \
 --user-agent "Mozilla/5.0 (X11; Linux x86_64; rv:10.0) Gecko/20100101 Firefox/10.0" \
 --rate-limit 1M                   \
 --embed-thumbnail                 \
 --ignore-errors                   \
 --restrict-filenames              \
 --extract-audio                   \
 --audio-quality 6                 \
 --audio-format mp3                \
 "$URL"                            \
 --output '[%(title)s]-[%(uploader)s]-[%(id)s].%(ext)s'

exit $?

# One line:
# /path/to/youtube-dl --format "bestaudio[ext=m4a]/mp4" --user-agent "Mozilla/5.0 (X11; Linux x86_64; rv:10.0) Gecko/20100101 Firefox/10.0" --rate-limit 1M --embed-thumbnail --ignore-errors --restrict-filenames --extract-audio --audio-quality 6 --audio-format mp3 "$URL"  --output '[%(title)s]-[%(uploader)s]-[%(id)s].%(ext)s'

# https://github.com/ytdl-org/youtube-dl
