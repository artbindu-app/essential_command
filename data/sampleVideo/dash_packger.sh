#!/bin/bash

set -e

INPUT="input.mp4"
OUTPUT_DIR="dash"
SEGMENT_DURATION=6

# Delete dash directory
echo "Cleaning previous DASH output..."
if [ -d "$OUTPUT_DIR" ]; then
    rm -rf "$OUTPUT_DIR"
    echo "$OUTPUT_DIR directory deleted."
else
    echo "$OUTPUT_DIR directory does not exist."
fi

# Create representation folders
echo "Creating directories..."
for i in 0 1; do
    mkdir -p "$OUTPUT_DIR/$i"
done

# Create media info JSON
ffprobe -v quiet -print_format json -show_format -show_streams "$INPUT" > "$OUTPUT_DIR"/mediaInfo.json

# Start DASH packaging
echo "Starting DASH packaging..."
ffmpeg -i "$INPUT" \
-map 0:v -map 0:a \
-c copy \
-f dash \
-seg_duration $SEGMENT_DURATION \
-use_template 1 \
-use_timeline 1 \
-init_seg_name "\$RepresentationID\$/init.m4s" \
-media_seg_name "\$RepresentationID\$/chunk_\$Number%05d\$.m4s" \
-adaptation_sets "id=0,streams=v id=1,streams=a" \
"$OUTPUT_DIR/manifest.mpd"

echo ""
echo "DASH packaging complete!"
echo "Output located in: $OUTPUT_DIR"