#!/bin/bash

# Download MP3s from a playlist (the only difference is "--yes-playlist"; and the URL, of course)

$URL=$1

if [ $# -eq 0 ]; then
  read -p "URL of a playlist: " URL
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
 --yes-playlist                    \
 $URL                              \
 --output '[%(playlist_index)s]-[%(uploader)s]-[%(title)s]-[%(id)s].%(ext)s'

exit $?

# One line:
# /path/to/youtube-dl --format "bestaudio[ext=m4a]/mp4" --user-agent "Mozilla/5.0 (X11; Linux x86_64; rv:10.0) Gecko/20100101 Firefox/10.0" --rate-limit 1M --embed-thumbnail --ignore-errors --restrict-filenames --extract-audio --audio-quality 6 --audio-format mp3 --yes-playlist $URL --output '[%(playlist_index)s]-[%(uploader)s]-[%(title)s]-[%(id)s].%(ext)s'

# https://github.com/ytdl-org/youtube-dl
