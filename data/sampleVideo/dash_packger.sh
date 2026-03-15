#!/bin/bash

set -e

INPUT="RawVideo.mp4"
OUTPUT_DIR="dash"

echo "Cleaning previous DASH output..."

# Delete dash directory
if [ -d "$OUTPUT_DIR" ]; then
    rm -rf "$OUTPUT_DIR"
    echo "$OUTPUT_DIR directory deleted."
else
    echo "$OUTPUT_DIR directory does not exist."
fi

# Create representation folders
echo "Creating directories..."
mkdir -p "$OUTPUT_DIR"/0
mkdir -p "$OUTPUT_DIR"/1

# Create media info JSON
ffprobe -v quiet -print_format json -show_format -show_streams "$INPUT" > "$OUTPUT_DIR"/mediaInfo.json

# Start DASH packaging
echo "Starting DASH packaging..."
ffmpeg -i "$INPUT" \
-map 0:v -map 0:a \
-c copy \
-f dash \
-seg_duration 6 \
-use_template 1 \
-use_timeline 1 \
-init_seg_name "\$RepresentationID\$/init.m4s" \
-media_seg_name "\$RepresentationID\$/chunk_\$Number%05d\$.m4s" \
-adaptation_sets "id=0,streams=v id=1,streams=a" \
"$OUTPUT_DIR/manifest.mpd"

echo ""
echo "DASH packaging complete!"