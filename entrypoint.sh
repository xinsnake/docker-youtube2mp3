#!/bin/sh
set -e

echo === processing $DOWNLOAD_URI ===
rm -rf /tmp/video.*
/usr/local/bin/youtube-dl -o '/tmp/video.%(ext)s' $DOWNLOAD_URI

echo === saving to "/data/output.mp3" ===
find /tmp -type f -name "video.*" | \
    xargs -I {} ffmpeg -i {} -vn -ab 128k -ar 44100 -y "/data/output.mp3"