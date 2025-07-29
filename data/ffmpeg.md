<!-- # ffmpeg Script Learning -->

Command | Description
------- | --------
`ffmpeg -version` | get version
`ffprobe -i input.mp4` | get media information
`ffprobe -v quiet -print_format json -show_format -show_streams input.mp4` | Show media information in JSON format
`ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 input.mp4` | media duration
`ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 input.mp4` | Show Video Frame
`ffmpeg -i input.mp4 -vf "transpose=1" output.mp4` | rotate video, 90° clockwise
`ffmpeg -i input.mp4 -vf "transpose=1,transpose=1,transpose=1" output.mp4` | rotate video, 270° clockwise
`ffmpeg -i input.mp4 -hide_banner` | get metadata
`ffmpeg -i input.mp4 -metadata title="New Title" -metadata artist="Artist Name" -c copy output.mp4` | Update video metadata
`ffmpeg -i input.mp4 -ss <start_pos_in_sec> -t <duration_in_sec> -vf "crop=1080:1920" -c:a copy output.mp4` | Crop Video from Center of the Video Frame
`ffmpeg -i input.mp4 -ss <start_pos_in_sec> -t <duration_in_sec> -vf "crop=1920:1080:(Video_width/3):(Video_Height/3)" -c:a copy output.mp4` | Crop Video from 1/3rd Position of Video Frame
`ffmpeg -i input.mkv -c:v copy -c:a aac -b:a 192k output.mp4` | Change audio codecs of a video <br> -c:a aac → Converts audio to AAC,<br> -b:a 192k → Audio bitrate
`ffmpeg -i input.mp4 -c:v libx264 -crf 23 -preset medium -c:a aac -b:a 192k output.mp4` | Change both video & audio codecs <br> -c:v libx264 → Encodes video to H.264 <br> -crf 23 → Frame Rate (lower = better quality; range: 18–28),<br> -preset medium → encoding speed vs compression efficiency (ultrafast, fast, medium, slow),<br> -c:a aac → Converts audio to AAC,<br> -b:a 192k → Audio bitrate
Crete test file 'videoList.txt' with info as : `file input1.mp4 ↵ file input2.mp4` <br> `ffmpeg -f concat -safe 0 -i videolist.txt -c copy output.mp4` | Merge multiple video with same configuration
`ffmpeg -i input.mp4 -vf reverse -an reversed_video.mp4` | Reverse video only
`ffmpeg -i input.mp4 -af areverse -vn reversed_audio.mp4` | Reverse audio only
`ffmpeg -i input.mp4 -vf reverse -af areverse reversed.mp4` | Reverse Video & Audio only
`ffmpeg -i input.mp4 -vn -acodec copy output_audio.aac` | Extract Audio from Video
`ffmpeg -i input.mp4 -q:a 0 -map a output_audio.mp3` | Extract Audio and convert to `.mp3` audio
`ffmpeg -i input_video.mp4 -i input_audio.mp3 -c:v copy -c:a aac -map 0:v:0 -map 1:a:0 output.mp4` | Replace video audio with new audio


<!--
function getCenter(percent, resolution= '3840x2160') {
    return `${parseInt(r.replace(/\w\d+$/, ''))*percent}x${parseInt(r.replace(/^\d+\w/, ''))*percent}`;
}
 -->

## 🧰 How to install ffmpeg on Windows

1. **Download FFmpeg**
   - Visit [gyan.dev FFmpeg builds](https://www.gyan.dev/ffmpeg/builds/) and download the latest **release full build** (`ffmpeg-release-full.7z`).
   - You’ll need a tool like **7-Zip** to extract `.7z` files.

2. **Extract the Files**
   - Use 7-Zip to extract the downloaded archive.
   - Rename the extracted folder to `ffmpeg` for simplicity.
   - Move this folder to `C:\` so the path becomes `C:\ffmpeg`.

3. **Add FFmpeg to System Path**
   - Open **System Properties** → Advanced → Environment Variables.
   - Under “System Variables,” find `Path`, click **Edit**, then **New**.
   - Add: `C:\ffmpeg\bin`
   - Click OK to save and exit.

4. **Verify Installation**
   - Open **Command Prompt** and type:
     ```bash
     ffmpeg -version
     ```
   - If installed correctly, you’ll see version info and configuration details.
