#!/bin/bash
say beginning AOSP build
open /Android.sparseimage
sleep 5s
cd /Volumes/Android/
say syncing directory and cherry picking files
repo sync
curl https://raw.github.com/dmeadows013/cherrypicks_d2vzw/cm11/cherrypicks.sh > ~/Documents/cherrypicks.sh
~/Documents/cherrypicks.sh
say cleaning working directory and preparing for build
ulimit -Hn 8192
ulimit -Sn 8192
. build/envsetup.sh
make clean -j9
say building the AOSP package
brunch d2vzw