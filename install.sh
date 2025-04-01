#!/bin/bash

if [ ! "$1" ]; then
  echo "usage: install.sh <profile name>"
  echo "       if a profile with the same name exists, add files to it"
  echo "       if not, create a new profile and add files there"
  exit
fi

# creates new profile if $1 does not exist
profile=$(find $HOME/.mozilla/firefox/ -maxdepth 1 -name "*$1")

if [ ! "$profile" ]; then
  firefox -CreateProfile "$1"
  sleep 2 # give firefox time to create the new profile
fi

profile=$(find $HOME/.mozilla/firefox/ -maxdepth 1 -name "*$1")

cp -r --backup=numbered chrome/ user.js $profile
cat user.js-extras >> $profile/user.js
