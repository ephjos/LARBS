#!/bin/bash
#

prompt() {
  read -p "$1 > " $2
}

prompt_required() {
  prompt $1 $2
  while [ "${!2}" = "" ]; do
    prompt "No value provided, $1" $2
  done
}

welcome() {
  clear
  read -p 'Welcome to JARBS! (press enter to continue) :'
  read -p 'Please make sure you have that latest pacman updates and refreshed keyrings, or else installation may fail (press enter to continue) :'
}

getusernameandpass() {
  prompt "Please provide a username" username
  while ! echo "$username" | grep "^[a-z_][a-z0-9_-]*$" >/dev/null 2>&1; do
    prompt "Username must start with a letter or underscore, and can only contain letters, numbers, -, and _" username
  done
}

prompt_required "test prompt" a
echo "$a"
exit

welcome
getusernameandpass

