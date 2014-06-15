#!/bin/bash


# New User (see here: https://www.debian-administration.org/article/2/Adding_new_users)
echo -n "Please supply a username: "
read line
adduser --disabled-password --gecos "" $line

passwd $line
chown $line:users "/home/$line"

echo "$line"

