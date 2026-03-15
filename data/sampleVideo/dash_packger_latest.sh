#!/bin/bash

set -e

INPUT="RawVideo.mp4"
OUTPUT_DIR="dash_latest"

# Delete dash directory
echo "Cleaning old DASH output..."
rm -rf "$OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"

# Create representation folders (4 video + 1 audio)
for i in 0 1 2 3 4; do
    mkdir -p "$OUTPUT_DIR/$i"
done

# Create media info JSON
ffprobe -v quiet -print_format json -show_format -show_streams "$INPUT" > "$OUTPUT_DIR"/mediaInfo.json

# Start DASH packaging with multi-resolution encoding
echo "Starting multi-resolution encoding..."
ffmpeg -y -i "$INPUT" \
-filter_complex "[0:v]split=4[v1][v2][v3][v4]; \
[v1]scale=1280:720[v720]; \
[v2]scale=854:480[v480]; \
[v3]scale=640:360[v360]; \
[v4]scale=426:240[v240]" \
-map "[v720]" -map "[v480]" -map "[v360]" -map "[v240]" -map 0:a:0 \
-c:v libx264 -preset fast -profile:v main \
-g 48 -keyint_min 48 -sc_threshold 0 \
-b:v:0 3000k -maxrate:v:0 3200k -bufsize:v:0 4200k \
-b:v:1 1500k -maxrate:v:1 1600k -bufsize:v:1 2100k \
-b:v:2 800k  -maxrate:v:2 900k  -bufsize:v:2 1200k \
-b:v:3 400k  -maxrate:v:3 450k  -bufsize:v:3 600k \
-c:a aac -b:a 128k -ac 2 \
-f dash \
-streaming 1 \
-seg_duration 6 \
-use_template 1 \
-use_timeline 1 \
-init_seg_name "\$RepresentationID\$/init.m4s" \
-media_seg_name "\$RepresentationID\$/chunk_\$Number%05d\$.m4s" \
-adaptation_sets "id=0,streams=v id=1,streams=a" \
"$OUTPUT_DIR/manifest.mpd"

echo ""
echo "DASH packaging complete!"
echo "Output located in: $OUTPUT_DIR"