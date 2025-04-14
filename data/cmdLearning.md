<!-- Windows Commands  -->

Command | Description
------- | --------
**`1. Directory:: create/delete/copy/move`** | 
`mkdir <dir_name>` or<br>`mkdir <path>\<dir_name>` | create directory
`rd /s /q <dir_name>` or<br>`rd /s /q <path>\<dir_name>` | delete directory
`move <folder_name> <moving_directory_path> `| Move folder 
`Xcopy <dir_name> <path> /E/H/C/I` or<br>`Xcopy <path>\<dir_name> <path> /E/H/C/I`| Copy Directory<br>`/E`–Copy subdirectories, including any empty ones.<br>`/H`-Copy files with hidden and system file attributes<br>`/C`-Continue copying even if an error occurs.<br>`/I`-If in doubt, always assume the destination is a folder
`ren <old_name> <new_name> `| Rename Folder
**`2. File Handling : create/rename/delete/move/open/copy/paste`** |
`type nul > <file_name*> `|Create file 
`ren <old_file_name> <new_file_name>.<extension> `|Rename file 
`del <file_name*> `|Delete file 
`<file_name>.<ext> > con  / start <file_name>.<ext> `|Open file 
`More <file_name>.<ext> `|See file content (Only `.txt` files)
**`3. File or Folder password protection`** |- worked for NTFS file system |
`cacls <dir_name> /P everyone:n` | Password protected directory for everyone
`cacls <dir_name> /P everyone:f` | Open for all, not password protected
`cacls <file_path>/<file_name> /P everyone:n` | Password protected file for everyone
`cacls <file_path>/<file_name> /P everyone:f` | Open for all, not password protected
**`4. WiFi/User Details `**|
`netsh wlan show profiles`| Show Profiles
`netsh wlan show profile <Profile_Name> key=clear`| User/Wifi Password (Security settings -> Key Content)
`Shutdown /s` | Shutdown computer 
`Shutdown /r`| Restart computer 	
`Shutdown /l` Or `Windows + r + logoff`| Logoff computer 	
`Shutdown /a`|Abort the shutdown process before the timeout;
`Shutdown -s -t <seconds>` | Shutdown using timer 	
`shutdown -r -t <seconds> ` | Shutdown and then ReStart using timer
 
