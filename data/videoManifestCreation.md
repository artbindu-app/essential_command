
## Dash & HLS Manifest generator using ffmpeg library

# Raw Video Info
```bash
ffprobe -v quiet -print_format json -show_format -show_streams "RawVideo.mp4" > "mediaInfo.json"
```

# Split MKV file into smaller chunks without re-encoding
```bash
# Raw file vidoe auto Chunks
mkdir raw_chunks
ffmpeg -i "RawVideo.mkv" -map 0 -c copy -f segment -segment_format mkv raw_chunks/stream_%d.mkv
```


# Extract individual streams from the MKV file
```bash
# Create Directory
mkdir raw_stream_separately

# Extract video
ffmpeg -i RawVideo.mp4 -map 0:v:0 -c copy raw_stream_separately/video.h264

# Extract Hindi audio (E-AC3)
ffmpeg -i "RawVideo.mkv" -map 0:a:0 -c copy raw_stream_separately/audio_hin.eac3

# Extract English audio (AAC)
ffmpeg -i "RawVideo.mkv" -map 0:a:1 -c copy raw_stream_separately/audio_eng.aac

# Extract English subtitle
ffmpeg -i "RawVideo.mkv" -map 0:s:0 -c copy raw_stream_separately/subs_eng.srt

# Extract English SDH subtitle
ffmpeg -i "RawVideo.mkv" -map 0:s:1 -c copy raw_stream_separately/subs_eng_sdh.srt

# Extract English forced subtitle
ffmpeg -i "RawVideo.mkv" -map 0:s:2 -c copy raw_stream_separately/subs_eng_forced.srt

# Extract Hindi subtitle
ffmpeg -i "RawVideo.mkv" -map 0:s:3 -c copy raw_stream_separately/subs_hin.srt

# Extract cover image
ffmpeg -i "RawVideo.mkv" -map 0:v:1 -c copy raw_stream_separately/cover.jpg
```

Perfect ✅ you’ve already extracted every stream separately (video, audios, subs, cover).

Now the next step is to **segment each stream into 10-second chunks** with FFmpeg.
```sh
mkdir video_hevc, audio_eac3, audio_aac, subs, cover
```

### 🎬 1. Video chunks (HEVC)
```bash
ffmpeg  -i raw_stream_separately/video.hevc -c copy -f segment -segment_time 10 -reset_timestamps 1 video_hevc/video_%03d.hevc
```
👉 This will make files like `video_000.hevc`, `video_001.hevc`, etc.

### 🔊 2. Audio chunks: **Hindi (E-AC3):**
```bash
# Hindi (E-AC3):
ffmpeg  -i raw_stream_separately/audio_hin.eac3 -c copy -f segment -segment_time 10 -reset_timestamps 1 audio_eac3/audio_hin_%03d.eac3

# English (AAC)
ffmpeg  -i raw_stream_separately/audio_eng.aac -c copy -f segment -segment_time 10 -reset_timestamps 1 audio_aac/audio_eng_%03d.aac
```

### 💬 3. Subtitles (SRT)

FFmpeg doesn’t segment subtitles in `.srt` directly like video/audio because `.srt` is text.
Instead, convert them to **WebVTT** (for streaming) and split:

**English:**

```bash
ffmpeg -i subs_eng.srt -f webvtt subs_eng.vtt
```

Then use a script (Python or Node.js) to split WebVTT every 10s, or let FFmpeg mux them into HLS/DASH manifests (simpler).

If you really need **separate .vtt per 10s**, you’ll need a small script to parse timestamps and cut them.

---

### 🖼️ 4. Cover image

This is static, no segmentation needed. Just keep `cover.jpg`.

---

### ⚡ 5. Automated all-in-one script (Linux/macOS)

```bash
#!/bin/bash
mkdir -p chunks

# Video
ffmpeg -i video.hevc -c copy -f segment -segment_time 10 -reset_timestamps 1 chunks/video_%03d.hevc

# Audio Hindi
ffmpeg -i audio_hin.eac3 -c copy -f segment -segment_time 10 -reset_timestamps 1 chunks/audio_hin_%03d.eac3

# Audio English
ffmpeg -i audio_eng.aac -c copy -f segment -segment_time 10 -reset_timestamps 1 chunks/audio_eng_%03d.aac

# Subtitles (convert to WebVTT, not chunked yet)
ffmpeg -i subs_eng.srt -f webvtt chunks/subs_eng.vtt
ffmpeg -i subs_eng_sdh.srt -f webvtt chunks/subs_eng_sdh.vtt
ffmpeg -i subs_eng_forced.srt -f webvtt chunks/subs_eng_forced.vtt
ffmpeg -i subs_hin.srt -f webvtt chunks/subs_hin.vtt

# Cover
cp cover.jpg chunks/cover.jpg
```

---

### ⚠️ Notes

* Video/audio will be truly chunked into 10-second segments.
* Subtitles are **kept as full files** (VTT) since splitting them is not straightforward with FFmpeg. Usually HLS/DASH servers handle subtitle timing.

---

👉 Do you want me to also make you a **master manifest (M3U8 + MPD)** that ties together your chunked video/audio/subs automatically, or do you prefer to keep the raw chunk files only?




ffmpeg -i RawVideo.mkv -map 0:v -c:v copy -map 0:a -c:a copy -map 0:s -c:s webvtt -seg_duration 10 -use_template 1 -use_timeline 1 -adaptation_sets "id=0,streams=v id=1,streams=a id=2,streams=s" -f dash manifest.mpd


ffmpeg -i "RawVideo.mkv"  -map 0:v -c:v copy  -map 0:a:0 -c:a aac -b:a 192k  -map 0:a:1 -c:a aac -b:a 192k  -map 0:s -c:s copy  -map -0:v:1  "Mission_Impossible_AAC.mkv"
