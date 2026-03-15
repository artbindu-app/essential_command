#!/bin/bash

INPUT="input.mp4"
OUTPUT_DIR="hls"

VIDEO_DIR="$OUTPUT_DIR/video"
AUDIO_DIR="$OUTPUT_DIR/audio"

# Create required directories
mkdir -p "$VIDEO_DIR"
mkdir -p "$AUDIO_DIR"

# Generate video HLS segments
ffmpeg -i "$INPUT" \
-map 0:v \
-c copy \
-f hls \
-hls_time 6 \
-hls_playlist_type vod \
-hls_segment_filename "$VIDEO_DIR/chunk_%03d.ts" \
"$VIDEO_DIR/playlist.m3u8"

# Generate audio HLS segments
ffmpeg -i "$INPUT" \
-map 0:a \
-c copy \
-f hls \
-hls_time 6 \
-hls_playlist_type vod \
-hls_segment_filename "$AUDIO_DIR/chunk_%03d.aac" \
"$AUDIO_DIR/playlist.m3u8"

# Create master playlist
cat <<EOF > "$OUTPUT_DIR/master.m3u8"
#EXTM3U
#EXT-X-VERSION:3
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="audio",NAME="English",DEFAULT=YES,AUTOSELECT=YES,URI="audio/playlist.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1000000,RESOLUTION=1280x720,AUDIO="audio"
video/playlist.m3u8
EOF

echo "HLS packaging complete!"