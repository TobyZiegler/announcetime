#!/usr/bin/env bash

#  AnnounceTime-launchd.sh
#  AnnounceTime
#
#  Created by TJ Ziegler on 9/03/22.
#  
# run announcetime script

# find the time and decide whether to turn on or off
osascript <<EOS
set preCommand to "plutil -replace TimeAnnouncementPrefs.TimeAnnouncementsEnabled -bool"
set postCommand to "~/Library/Preferences/com.apple.speech.synthesis.general.prefs.plist; defaults read com.apple.speech.synthesis.general.prefs.plist;"
set workStart to 27000
set workEnd to 63000
set theState to false
set nowTime to (time of (current date))
if workStart < nowTime and nowTime < workEnd then
    set theState to true
end if
if theState then
    do shell script preCommand & " YES " & postCommand
    say "Announcements on" using "Samantha"
else
    do shell script preCommand & " NO " & postCommand
    say "Announcements off" using "Samantha"
end if
EOS
