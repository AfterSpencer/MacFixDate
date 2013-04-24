This project was developed to deal with an issue I was seeing on some of the older Macbooks in our environment not being able to connect to wireless after their battery died. The root of the problem is that the cmos battery (or whatever the Apple equivalent is) had died and so when the battery died the clock got set back to sometime in 2001. 

It seems that wireless networks are particular when it comes to how out of date the clients clocks are before they will allow them to connect and update time from and NTP server. The clock can be a little out of date, just not too much. I expect that this script will work as written for a good number of years and will be able ot be updated by modifying line 14 to give it a new year when it stops working.

Useage

There are two files included, fixdate.sh and crontab.

While crontab is depricated in OSX it still works.

Put the crontab file in /etc/. If there is an existing crontab put the following in it:

@reboot root /usr/local/bin/fixdate.sh

Put the fixdate.sh in /usr/local/bin/fixdate.sh

Be sure that fixdate has +x. Ideally it should be owned by root and have 500 permissions that way it can't be edited to do anything nasty by other users.

Once these two files are in place the user only has to reboot to fix the problem if their time is out of date.
