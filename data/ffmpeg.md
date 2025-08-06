<!-- # ffmpeg Script Learning -->

Command | Description
------- | --------
`ffmpeg -version` | get version
`ffprobe -i <filename>.<extension>` | get media information
`ffmpeg -i <filename>.<extension> -hide_banner` | get metadata
`ffprobe -v quiet -print_format json -show_format -show_streams <filename>.<extension>` | Show media information in JSON format
`ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 <filename>.<extension>` | media duration
`ffmpeg -i input.mp3 -af "volumedetect" -vn -sn -dn -f null -` | View Media Volume
`ffmpeg -i input.mp4 -filter:a "volume=1.5" -c:v copy output.mp4` | Increase Volume by a Percentage
`ffmpeg -i input.mp4 -filter:a "volume=5dB" -c:v copy output.mp4` | Increase Volume by Decibels
FFmpeg (Audio) | 
`ffmpeg -i input.mp3 -ss 00:00:30 -t 30 -c copy output.mp3` | trim audio
FFmpeg (Video) | 
------- | --------
`ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 input.mp4` | Show Video Frame
`ffmpeg -i input.mp4 -ss 00:01:00 -t 00:00:30 -c copy output.mp4` | trim video frame from start time to time range, trim data: 00:01:00-00:01:30
`ffmpeg -i input.mp4 -ss 00:01:00 -to 00:01:30 -c copy output.mp4` | trim video frame between two position, trim data: 00:01:00-00:01:30
`ffmpeg -i input.mp3 -ss 00:00:30 -to 00:01:00 -c copy output.mp3` | trim audio
`ffmpeg -i input.mp4 -vf "transpose=1" output.mp4` | rotate video, 90° clockwise
`ffmpeg -i input.mp4 -vf "transpose=1,transpose=1,transpose=1" output.mp4` | rotate video, 270° clockwise
`ffmpeg -i input.mp4 -metadata title="New Title" -metadata artist="Artist Name" -c copy output.mp4` | Update video metadata
`ffmpeg -i input.mp4 -ss <start_pos_in_sec> -t <duration_in_sec> -vf "crop=1080:1920" -c:a copy output.mp4` | Crop Video from Center of the Video Frame
`ffmpeg -i input.mp4 -ss <start_pos_in_sec> -t <duration_in_sec> -vf "crop=1920:1080:(Video_width/3):(Video_Height/3)" -c:a copy output.mp4` | Crop Video from 1/3rd Position of Video Frame
`ffmpeg -i input.mp4 -c:v libx264 -crf 23 -preset medium output.mp4` | Change video codecs of a video <br> -c:v libx264 → Encodes video to H.264 <br> -crf 23 → Frame Rate (lower = better quality; range: 18–28),<br> -preset medium → encoding speed vs compression efficiency (ultrafast, fast, medium, slow)
`ffmpeg -i input.mkv -c:v copy -c:a aac -b:a 192k output.mp4` | Change audio codecs of a video <br> -c:a aac → Converts audio to AAC,<br> -b:a 192k → Audio bitrate
`ffmpeg -i input.mp4 -c:v libx264 -crf 23 -preset medium -c:a aac -b:a 192k output.mp4` | Change both video & audio codecs <br> -c:v libx264 → Encodes video to H.264 <br> -crf 23 → Frame Rate (lower = better quality; range: 18–28),<br> -preset medium → encoding speed vs compression efficiency (ultrafast, fast, medium, slow),<br> -c:a aac → Converts audio to AAC,<br> -b:a 192k → Audio bitrate
Create test file 'videoList.txt' with info as : `file input1.mp4 ↵ file input2.mp4` <br> `ffmpeg -f concat -safe 0 -i videolist.txt -c copy output.mp4` | Merge multiple video with same configuration
`ffmpeg -i input.mp4 -vf reverse -an reversed_video.mp4` | Reverse video only
`ffmpeg -i input.mp4 -af areverse -vn reversed_audio.mp4` | Reverse audio only
`ffmpeg -i input.mp4 -vf reverse -af areverse reversed.mp4` | Reverse Video & Audio only
`ffmpeg -i input.mp4 -vn -acodec copy output_audio.aac` | Extract Audio from Video
`ffmpeg -i input.mp4 -q:a 0 -map a output_audio.mp3` | Extract Audio and convert to `.mp3` audio
`ffmpeg -i input_video.mp4 -i input_audio.mp3 -c:v copy -c:a aac -map 0:v:0 -map 1:a:0 output.mp4` | Replace video audio with new audio
`ffmpeg -i input.mp4 -filter:v "setpts=2.0*PTS" output.mp4` | Update video playback rate (0.5x)
`ffmpeg -i input.mp4 -filter_complex "[0:v]setpts=2.0*PTS[v];[0:a]atempo=0.5[a]" -map "[v]" -map "[a]" output.mp4` | Update video playback rate (0.5x) sync with audi speed
`ffmpeg -i input.mp4 -vf hflip output.mp4` | Horizontal flip
`ffmpeg -i input.mp4 -vf vflip output.mp4` | Vertical flip
`ffmpeg -i input.mp4 -vf hflip,vflip output.mp4` | Horizontal & Vertical filp
`ffmpeg -i input.mp4 -map 0:v -vf reverse -map 0:a -c:a copy output.mp4` | reverse video only (audio not reverse)
`ffmpeg -i input.mp4 -c:v copy -an output.mp4` | Remove audio from video (without re-encoding)
`ffmpeg -i input.mp4 -an output.mp4` | Remove audio with Re-encode Video
`ffmpeg -i video.mp4 -i audio.mp3 -c:v copy -c:a aac -strict experimental output.mp4` | Merge audio & video
`ffmpeg -i video.mp4 -i audio.mp3 -c:v copy -c:a aac -shortest output.mp4` | Add audio with video (if audio is longer then auto trim)


<!--
function getCenter(percent, resolution= '3840x2160') {
    return `${(Number(resolution.replace(/\w\d+$/, ''))*percent).toFixed(0)}:${(Number(resolution.replace(/^\d+\w/, ''))*percent).toFixed(0)}`;
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
