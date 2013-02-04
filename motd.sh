#!/bin/bash
# varible for the verse reference
verse=""
# varible for the message or verse content
message=""

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function getContentFromBiblegateway ()
{
  # curl the verse of the day
  # suppress output
  # wait 10 seconds for timeout
  # output the rss file to the project directory 
  # wait for curl to complete before continuing in the script
  curl -s --connect-timeout 10 -o $votd_directory http://www.biblegateway.com/votd/get/?format=atom&version=ESV
  wait
}

# Pass rss file through sed to get the message and verse reference
function sendToScript ()
{
  message=`sed -n '/&ldquo;.*&/ p' $DIR/votd`
  verse=`sed -n '14 p' $DIR/votd`
  $DIR/votd.pl "$verse" "$message" 
}

if [ -f votd ]
  then
    statDate=`stat -c %y $DIR/votd | awk '{print $1}'`
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
