#!/bin/bash

# TO USE: Set which functions you want to run to true

doFirewall=false
doSSH=false
doSystemCtl=false
doUsers=false # Work in progress


function enableFirewall { # Doesn't fully secure ports or deny ping requests
    ufw enable
    ufw allow http
    ufw allow https
    ufw logging on
}

function enableSSH {
    apt install -y openssh-server
    ufw allow ssh
}

function handleSystemCtl {
    sysctl -w net.ipv4.tcp_syncookies=1
	sysctl -w net.ipv4.ip_forward=0
	sysctl -w net.ipv4.conf.all.send_redirects=0
	sysctl -w net.ipv4.conf.default.send_redirects=0
	sysctl -w net.ipv4.conf.all.accept_redirects=0
	sysctl -w net.ipv4.conf.default.accept_redirects=0
	sysctl -w net.ipv4.conf.all.secure_redirects=0
	sysctl -w net.ipv4.conf.default.secure_redirects=0
}

function handleUsers { # Work in progress
    admins=()
    regulars=()
    exemptions=()
}


if [ $doFirewall = true ]; then
    enableFirewall
fi

if [ $doSSH = true ]; then
    enableSSH
fi

if [ $doUsers = true ]; then
    handleUsers
fi

if [ $doSystemCtl = true ]; then
    handleSystemCtl
fi
