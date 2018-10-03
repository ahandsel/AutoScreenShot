tell application "System Events"
	set dFolder to "~/Desktop/screencapture/"
	do shell script ("mkdir -p " & dFolder)
	set page to 10
	set i to 0
	repeat page times
		do shell script ("screencapture " & dFolder & "frame-" & i & ".png")
		click at {1308, 59}
		delay 0
		set i to i + 1
	end repeat
end tell
