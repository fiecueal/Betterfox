#!/bin/bash

dir="$HOME/.mozilla/firefox/"
if [ "$1" ]; then
  dir="$1"
fi

ls $dir --hide=profiles.ini --hide=installs.ini --hide='Pending Pings' --hide='Crash Reports'
