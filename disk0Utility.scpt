#initial dialog, only place where user interacts
#spawn dialog w/ text, title, two options
set answer to the button returned of (display dialog "What would you like to do with disk0?" with title "disk0 Utility" with icon caution buttons {"Spin Up", "Spin Down"})

if answer = "Spin Up" then
#mount first volume
	do shell script "diskutil mount REPLACE-THIS-WITH-VOLUME-UUID"
#tell the user it's done
	display dialog "Mounted first volume.
(disk0s2)" with title "disk0 Utility" buttons {"Continue"} giving up after 3 #dialog autocloses after 3 sec
	
#mount second volume
	do shell script "diskutil mount REPLACE-THIS-WITH-ANOTHER-VOLUME-UUID"
#tell the user it's done
	display dialog "Mounted second volume.
(disk0s5)" with title "disk0 Utility" buttons {"Finish"} giving up after 3 #dialog autocloses after 3 sec
	
	
else if answer = "Spin Down" then

#unmount disk0
	do shell script "diskutil unmountDisk disk0"
#tell user it's done
	display dialog "Unmounted disk0." with title "disk0 Utility" buttons {"Finish"} giving up after 3 #dialog autocloses after 3 sec
	
end if


#Quirks:
# 1: Because the info dialogs automatically close, the 'Continue' and 'Finish' buttons aren't really needed, but 
# AppleScript REQUIRES them. Even if the code *for* the buttons is removed, a couple of filler buttons get thrown in.
