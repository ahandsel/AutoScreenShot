tell application "System Events"
	set dFolder to "~/Desktop/screencapture/"
	do shell script ("mkdir -p " & dFolder)
	set Book_Title_Answer to display dialog "Book's Title" default answer "" with icon note buttons {"Cancel", "Continue"} default button "Continue"
	
	set Book_Title to text returned of Book_Title_Answer
	
	set Mouse_Q to "
Input the NEXT button's coordinates.

Input format: x, y
Example: 1301, 63

**If you are unsure the NEXT button's location, hover over the button & press Shift-Command (⌘)-4. Use the coordinates that displays."
	
	repeat
		set Page_Count_txt to the text returned of (display dialog "How many pages in the book?" default answer "" with icon note buttons {"Cancel", "Continue"} default button "Continue")
		if Page_Count_txt is "" then
			beep
			display alert "Please enter your answer to continue."
		else
			exit repeat
		end if
	end repeat
	
	repeat
		set mouse_loc to the text returned of (display dialog Mouse_Q default answer "1301, 63" with icon note buttons {"Cancel", "Continue"} default button "Continue")
		if mouse_loc is "" then
			beep
			display alert "Please enter your answer to continue."
		else
			exit repeat
		end if
	end repeat
	
	set comma_pt to offset of "," in mouse_loc
	set comma_pt_X to comma_pt - 1
	set comma_pt_Y to comma_pt + 2
	
	set mouse_loc_length to the length of mouse_loc
	
	set X_pt to characters 1 thru comma_pt_X of mouse_loc as string
	set X_pt to X_pt as integer
	
	set Y_pt to characters comma_pt_Y thru mouse_loc_length of mouse_loc as string
	set Y_pt to Y_pt as integer
	
	set Page_Count to Page_Count_txt as integer
	
	set theDialogText to "
Auto ScreenShot will be start in 10 seconds. 
Configure your screen as you want it to be captured."
	display dialog theDialogText
	
	delay 10
	
	set i to 1
	repeat Page_Count times
		do shell script ("screencapture " & dFolder & Book_Title & "-" & i & ".png")
		click at {X_pt, Y_pt}
		delay 0
		set i to i + 1
	end repeat
	
	set Done_Text to "
Yea! We are all done! 
Your screenshots are saved under screencapture folder on your desktop."
	display dialog Done_Text --> Result: {button returned:"OK"}
	
end tell
