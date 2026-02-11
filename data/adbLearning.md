<!-- # ADB related commands -->

## ADB Learning

### Basic Of ADB

➤ Install ADB - [Link](https://developer.android.com/tools/releases/platform-tools)<br>
➤ Blog: [How to🔨uninstall default unused android application📲](https://medium.com/@artbindu/how-to-uninstall-default-unused-android-application-29780f33eba4)<br>
➤ [ADB Installation in MAC](https://formulae.brew.sh/cask/android-platform-tools): `brew install --cask android-platform-tools`

### ADB Powerful command

Command | Description
------- | --------
`adb --version` | View adb version
`adb devices` | see list of connected devices through adb
`adb connect <ip>:<port>` | connect devices through ip (default port: 5555)
`adb connect <device_id>` | connect devices through USB
`adb kill-server`| disconnect all connected devices
`adb start-server` | adb restart server
`adb tcp <tcp port>` | Reset tcp port: 5555 (default)
`adb usb` | Restarting the USB Mode
`adb reboot` | reboot connected device
`adb logcat` | show device log
`adb logcat -c` | clear all logs in adb terminal
`adb logcat > <fileName>.<extension>` | store device log into a file
`adb logcat > "<path>/<fileName>.<extension>` | store device log into a specific directory
`adb logcat chromium:D SystemWebViewClient:D *:s` | View Chromecast Device Log
`adb -s <device_id or ip> install "<apk_file_path>/<apkFileName>.apk"` | install any apk from PC to device
`adb -s <device_id or ip> uninstall <native_app_id>` | Uninstall the device app
`adb shell pm uninstall -k --user 0 <package name>` | Forcefully uninstall
`adb -s <device_id/only_ip> reboot` | restart device through adb
`adb shell pm list packages` | Show all install packages in your system
`adb -s 172.26.94.164:5555 shell pm list packages \| grep -Ei '\.(google\|amazone)\.'` | Show all install packages in your system with specific keyword (google or amazone) (Case-insensitive)
`adb shell pm list packages \| findstr <OEM/Carrier/App Name>` <br>or<br> `adb shell pm list packages \| grep <OEM/Carrier/App Name>` | adb show app list under a specific packages
`adb shell monkey -p <app_name_from_adb_packages> -c android.intent.category.LAUNCHER 1` |  Force to stop Application using ADB
`adb shell am force-stop <app_name_from_adb_packages>` |  Force to stop Application using ADB
`adb shell getprop` | get connected system properties
`adb shell getprop ro.build.version.release`| Get Device Android version
`adb shell getprop ro.build.version.sdk`| Get Device SDK version
`adb shell getprop ro.serialno` | get serial number
`adb shell getprop \| findstr ro.product` | Get all product information
`adb shell` + `↵` + `echo $SHELL` | get current shell (if `adb shell getprop` not work)
`adb shell` + `↵` + `whoami` | get current user (if `adb shell getprop` not work)
`adb shell` + `↵` + `printenv` + `↵` + `echo $PATH` | get environment variable & path (if `adb shell getprop` not work)
`adb shell` + `↵` + `uname -a` | System details (if `adb shell getprop` not work)
`adb shell input text "<input_text>"` | Input text from remote device
`adb remount`| put `/system` partition in writable mode. By default `/system` is only readable. It could only be done on rooted device.
Media Configuration |
`adb shell media` | Get ADB Media command info
Up-Down Volume through ADB |
`adb shell media volume --get`| Get Current volume Info<br>It will show you current volume value & actual volume range like: [0:10]
`adb shell media volume --show  --set <volume value>`| Set Volume with in about volume range
`adb shell input keyevent <event_code>` | Triggered android/remote  <a href="./data/rawData/keyevents.json" target="_blank"> key event </a> - <a href="https://developer.android.com/reference/android/view/KeyEvent" target="_blank"> Android KeyEvents </a>



<!-- https://gist.github.com/Pulimet/5013acf2cd5b28e55036c82c91bd56d8 -->
