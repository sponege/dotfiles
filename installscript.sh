#!/bin/bash

## install initial packages

# check UID to make sure user is running as root
if [ "$EUID" -ne 0 ]; then
  echo "error: not root; please run as root"
  exit 126
fi


if [ -f /bin/pacman ]; then

  # pacman -Syu discord s3m lynx --needed # update and install Discord and lynx (for downloading Discord plugins), if already installed dont reinstall
  # wget https://github.com/BetterDiscord/Installer/releases/latest/download/BetterDiscord-Linux.AppImage # download BetterDiscord installer
  # chmod +x ./BetterDiscord-Linux.AppImage # make it executable

  plugins=(7 11 29 60 61 63 64 65 66 67 68 69 70 71 77 78 80 81 85 88 91 92 94 95 96 97 98 99 100 103 104 107 109 137 138 139 159 160 162 164 179 181 184 192 193 196 200 220 228 238 240 274 284 291 293 317 337 340 350 351 352 361 364 377 382 383 398 401 407 441 471 500 509 520 523 525 539)
  for t in ${plugins[@]}; do # loop through all plugins that sponege hand-picked himself
    wget --content-disposition --no-http-keep-alive "https://betterdiscord.app/Download?id=$t" # download all plugins
    # https://unix.stackexchange.com/questions/453465/wget-how-to-download-a-served-file-keeping-its-name
    # https://unix.stackexchange.com/questions/410493/stop-wget-reusing-existing-connection
  done


elif [ -f /bin/apt ]; then

  apt update

fi
