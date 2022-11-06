#!/bin/bash

doFirewall=false
doUsers=false # Work in progress


function enableFirewall { # Doesn't fully secure ports or deny ping requests
    ufw enable
    ufw allow http
    ufw allow https
    ufw logging on
}

function enableSSH {
    apt install -y openssh-server

}

function handleUsers { # Work in progress
    admins=()
    regulars=()
    exemptions=()
}