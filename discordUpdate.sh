#!/bin/bash

baseUri=https://dl.discordapp.net/apps/linux

fullpath=`find /home/caghetti/.config/discord -type d -name '*.*.*'`
currentVersion=`basename $fullpath`

IFS='.' read -r -a components <<< "$currentVersion"
majorVersion=${components[0]}
minorVersion=${components[1]}
patchVersion=${components[2]}


cd /tmp/
newVersion=$majorVersion.$minorVersion.$((${patchVersion} + 1))
wget $baseUri/$newVersion/discord-$newVersion.deb 1>/dev/null 2>/dev/null
if [ -f /tmp/discord-$newVersion.deb ]
then
  sudo dpkg -i /tmp/discord-$newVersion.deb
fi

newVersion=$majorVersion.$((${minorVersion} +1)).0
wget $baseUri/$newVersion/discord-$newVersion.deb 1>/dev/null 2>/dev/null
if [ -f /tmp/discord-$newVersion.deb ]
then
  sudo dpkg -i /tmp/discord-$newVersion.deb
fi

newVersion=$((${majorVersion} +1)).0.0
wget $baseUri/$newVersion/discord-$newVersion.deb 1>/dev/null 2>/dev/null
if [ -f /tmp/discord-$newVersion.deb ]
then
  sudo dpkg -i /tmp/discord-$newVersion.deb
fi

/usr/bin/discord
exit 0
