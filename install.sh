#!/bin/bash

# creates new profile if $1 does not exist
if [ "$1" ]; then
  profile=$(find $HOME/.mozilla/firefox/ -maxdepth 1 -name "*.$1")
else
  firefox -CreateProfile "$1"
  sleep 2 # give firefox time to create the new profile
  profile=$(find $HOME/.mozilla/firefox/ -maxdepth 1 -name "*.$1")
fi

cp -r --backup=numbered chrome/ user.js $profile
cat user.js-extras >> $profile/user.js
