#!/bin/bash

baseUri=https://dl.discordapp.net/apps/linux

fullpath=`find /home/caghetti/.config/discord -type d -name '*.*.*'`
currentVersion=`basename $fullpath`


cd /tmp/
newVersion=`url -I -s 'https://discord.com/api/download?platform=linux&format=deb' | grep -i '^Location:' | sed -n 's/.*\/\([0-9.]*\)\/.*/\1/p'`
if [ "$currentVersion" != "$newVersion" ]; then
    wget $baseUri/$newVersion/discord-$newVersion.deb 1>/dev/null 2>/dev/null
    sudo dpkg -i /tmp/discord-$newVersion.deb
fi

/usr/bin/discord
exit 0
