#!/usr/bin/env bash

playAcestream() {
  STREAM_ID=$1

  startAcestream () {
   DOCKER_IMAGE_NAME="magnetikonline/acestream-server"
   SERVER_HTTP_PORT="6878"
   STATE_DIR="/tmp"
   STATE_TMPFS_SIZE_MB="4096"
   docker run \
          -d \
          --publish "$SERVER_HTTP_PORT:$SERVER_HTTP_PORT" \
          --rm \
          --tmpfs "/dev/disk/by-id:noexec,rw,size=4k" \
          --tmpfs "$STATE_DIR:noexec,rw,size=${STATE_TMPFS_SIZE_MB}m" \
                  "$DOCKER_IMAGE_NAME"
  }

  startAcestream
  QT_AUTO_SCREEN_SCALE_FACTOR=0 vlc "http://127.0.0.1:6878/ace/getstream?id=$STREAM_ID"
}
