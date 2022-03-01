#!/usr/bin/env bash

generate-password() {
    xkcdpass -d "-1" -C random
}

generate-ssh-key-hint() {
  echo 'ssh-keygen -t ed25519 -C "your_email@example.com"'
}

myip-addresses() {
    ifconfig | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}'

    curl ipecho.net/plain
    echo
}

README-preview() {
    grip "$1" 7777 -b 
}

gpush() {
  git add -A
  git commit -m "$1"
  git push origin $(git symbolic-ref --short -q HEAD)
}

gpushp() {
  git add -A
  git commit -m "$1"
  git push private $(git symbolic-ref --short -q HEAD)
}

clearDS_Store() {
  find . -type f -name .DS_Store -print0 | xargs -0 rm
}
