#!/bin/bash

# creates new profile if $1 does not exist
profile=$(find $HOME/.mozilla/firefox/ -maxdepth 1 -name "*.$1")

if [ ! "$profile" ]; then
  firefox -CreateProfile "$1"
  sleep 2 # give firefox time to create the new profile
fi

profile=$(find $HOME/.mozilla/firefox/ -maxdepth 1 -name "*.$1")

cp -r --backup=numbered chrome/ user.js $profile
cat user.js-extras >> $profile/user.js
