#!/bin/bash

# accepts profile name for $1
# if any second argument exists, create new profile
if [ -z "$2" ]; then
  profile=$(find $HOME/.mozilla/firefox/ -maxdepth 1 -name "*.$1")
else
  firefox -CreateProfile "$1"
  sleep 2 # give firefox time to create the new profile
  profile=$(find $HOME/.mozilla/firefox/ -maxdepth 1 -name "*.$1")
fi

cp -r --backup=numbered chrome/ user.js $profile
cat user.js-extras >> $profile/user.js
