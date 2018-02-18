FROM python:alpine

# upgrade packages, install ffmpeg
RUN apk update && apk upgrade && apk add ffmpeg

# put youtube-dl
ADD https://yt-dl.org/downloads/latest/youtube-dl  /usr/local/bin/youtube-dl

# put entrypoint.sh
COPY entrypoint.sh /entrypoint.sh

# modify permission to allow execute
RUN chmod a+x /entrypoint.sh && chmod a+rx /usr/local/bin/youtube-dl

# execute
CMD ["/entrypoint.sh"]