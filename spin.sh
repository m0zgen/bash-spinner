#!/bin/bash
# Created by Yevgeniy Goncharov, https://sys-adm.in
# Spinner example script

spinner()
{
    local pid=$1
    local delay=0.4
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

# Example system update
yum update samba -q -y &
echo -n "Updating system, please wait... "
spinner $!
echo " DONE"

# Example sleep
(sleep 5) &
echo -n "Sleep system, please wait... "
spinner $!
echo " DONE"