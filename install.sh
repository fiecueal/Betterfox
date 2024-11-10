#!/bin/bash

# assuming current dir is the ff profile -> `install.sh $(pwd)`
# if any second argument exists
if [ -z "$2" ]; then
  dir="$1"
else
  name="$1"
  firefox -CreateProfile "$name"
  sleep 2 # give firefox time to create the new profile
  dir=$(find $HOME/.mozilla/firefox/ -maxdepth 1 -name "*.$name")
fi

cp -r --backup=numbered chrome/ user.js $dir
cat user.js-extras >> $dir/user.js
