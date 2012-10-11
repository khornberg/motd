#!/bin/bash
# varible for the verse reference
verse=""
# varible for the message or verse content
message=""

function getContentFromBiblegateway ()
{
  # curl the verse of the day
  # suppress output
  # wait 10 seconds for timeout
  # output the to the current directory
  # wait for curl to complete before continuing in the script
  curl -s --connect-timeout 10 -o ~/Projects/motd/votd http://www.biblegateway.com/votd/get/?format=atom&version=ESV
  wait
}

function sendToScript ()
{
  message=`sed -n '/&ldquo;.*&/ p' ~/Projects/motd/votd`
  verse=`sed -n '14 p' ~/Projects/motd/votd`
  ~/Projects/motd/votd.pl "$verse" "$message" 
}

if [ -f votd ]
  then
    statDate=`stat -c %y ~/Projects/motd/votd | awk '{print $1}'`
    if [[ $statDate != `date +"%Y-%m-%d"` ]]
      then
        getContentFromBiblegateway
        sendToScript
    else
      sendToScript
    fi
else
   getContentFromBiblegateway
   sendToScript
fi
