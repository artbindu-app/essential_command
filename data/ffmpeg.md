<!-- # ffmpeg Script Learning -->

Command | Description
------- | --------
`ffmpeg -version` | get version
`ffprobe -i input.mp4` | get media information
`ffprobe -v quiet -print_format json -show_format -show_streams input.mp4` | Show media information in JSON format
`ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 input.mp4` | media duration
`ffmpeg -i input.mp4 -vf "transpose=1" output.mp4` | rotate video, 90° clockwise
`ffmpeg -i input.mp4 -vf "transpose=1,transpose=1,transpose=1" output.mp4` | rotate video, 270° clockwise
`ffmpeg -i input.mp4 -hide_banner` | get metadata
`ffmpeg -i input.mp4 -metadata title="New Title" -metadata artist="Artist Name" -c copy output.mp4` | Update video metadata


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
