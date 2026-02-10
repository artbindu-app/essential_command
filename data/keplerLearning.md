<!-- # Kepler related commands -->

## Kepler Learning

### ADB Powerful command

Install the Kepler SDK
Step | Command | Description
---- | ------- | -----------
1 | `curl -o kepler-sdk.tar.gz https://kepler-sdk.s3.amazonaws.com/kepler-sdk-0.20.3719.tar.gz` | Download Kepler SDK
2 | `tar -xzf kepler-sdk.tar.gz -C /Users/<user.name>/kepler/sdk/` | Extract Kepler SDK to `/Users/<user.name>/kepler/sdk/` (Mac)
3 | `rm kepler-sdk.tar.gz` | Remove the downloaded tar.gz file

Command | Description
------- | --------
SETTING → My Fire TV → About (Press 7 times to enable Developer Options) | Enable Developer Options
SETTING → My Fire TV → Developer Options → Enable DEV Mode| Enable Dev Mode
`/Users/<user.name>/kepler/sdk/<sdk_version>/bin/tools` | Kepler SDK Path: `/Users/Biswasindhu.Mandal/kepler/sdk/0.20.3719/bin/tools`
`kepler --version` | View kepler version
`export KEPLER_SDK_PATH=/Users/Biswasindhu.Mandal/kepler/sdk/0.20.3719`<br>`export PATH=$KEPLER_SDK_PATH/bin:$PATH`<br>`export PATH=$KEPLER_SDK_PATH/bin/tools:$PATH`<br>`kepler exec vda` | Set Kepler Environment Variable (Mac)
`kepler help` | Kepler Help
`kepler device list` | Kepler Device List
`kepler exec vda connect <ip>:<port>` | connect devices through ip (default port: 5555) <br> `kepler exec vda connect 172.26.88.74:5555`
`kepler exec vda connect <device_id>` | connect devices through USB
`kepler exec vda start-server` | Kepler Device Start Server
`kepler exec vda kill-server` | Kepler Device Kill Server
`kepler exec vda reconnect` | Kepler Device Reconnect
`kepler exec vda reconnect device ` | Kepler Device Reconnect specific device
`kepler exec vda reboot` | Kepler Device Reboot
`kepler exec vda usb` | Kepler Device Restart USB Mode
`kepler exec vda tcpip` | Kepler Device Restart TCP/IP Mode
`kepler exec vda root` | Restart vdad with root permission
`kepler exec vda unroot` | Restart vdad without root permission
`kepler device installed-apps --device 172.26.88.74:5555` | View all installed apps in device
`kepler device launch-app -a <app_name_from_kepler_packages>` | Launch app from device
`kepler device uninstall-app --appId <app_name_from_kepler_packages>` | Uninstall app from device
`kepler shell` + `↵` + `echo $SHELL` | get current shell (if `kepler shell getprop` not work)
`kepler shell` + `↵` + `whoami` | get current user (if `kepler shell getprop` not work)
`kepler shell` + `↵` + `printenv` + `↵` + `echo $PATH` | get environment variable & path (if `kepler shell getprop` not work)
`kepler shell` + `↵` + `uname -a` | System details (if `kepler shell getprop` not work)
`open /Users/<user.name>/.kepler/logs` | Open Kepler Logs
`rm *.vpkg` | Delete File
`rmdir foldername` | Delete Directory

