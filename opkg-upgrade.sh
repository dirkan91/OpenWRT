#!/bin/sh

opkg update
LIST=$(opkg list-upgradable | cut -d" " -f1)
NUMBER=$(echo $LIST | wc -w)
if [ "$NUMBER" -gt "0" ]
then
  for PACKAGE in $LIST
  do
    opkg upgrade $PACKAGE
  done
  echo "Upgrade done. $NUMBER packages upgraded"
else
  echo "No packages to upgrade"
fi
