motd
====

Message of the Day

Runs when you open your terminal or start bash and displays the daily verse of
the day from BibleGateway.com.

````
Verse of the Day: Rejoice with those who rejoice; mourn with those who
mourn.
  Romans 12:15
~/motd$
````
 
Add the call to run motd.sh from your current rc file.

You can change the Bible version of the verse by editing line 14 of the motd.sh
file.

This script uses curl to download the feed from biblegateway.com and stores it
where ever this script is run from.
