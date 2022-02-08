#!/bin/bash

# check UID to make sure user is NOT running as root
if [ "$EUID" -eq 0 ]; then
  echo "error: you are root; please do not run as root!"
  exit 126
fi
user=$(whoami)
dotfiles=$(pwd)
echo "Logged in as $user"

# oldshell=$SHELL # save old shell for later
# sudo usermod --shell /bin/bash $user # switch to bash, since this script is a bash script


# echo "Switching to root user..."
# sudo -s <<EOF # we now have username of current user, now change to root user

if [ "$1" = "install"  ]; then
  if [ -f /bin/pacman ]; then
    sudo pacman -Syu # update

    packages=(
    discord # for chatting
    w3m lynx # both w3m and lynx are cool terminal browsers B)
    atom apm # best text editor
    nodejs npm # programming essentials
    gimp # image manipulation is a great tool to have
    )

    for package in ${packages[@]}; do
      sudo pacman -S $package --needed # install all packages, if already installed dont reinstall
    done

    packages=(
    atom-discord # discord rich presence for atom
    prettier-atom # make sure "Format Files on Save" is on, prettifies your javascript code on save
    teletype # collab with others
    chrome-color-picker # its like VSCode's color picker, but better. shortcut is ctrl+alt+c
    )

    for package in ${packages[@]}; do
      apm install $package # install all packages, if already installed dont reinstall
    done


  elif [ -f /bin/apt ]; then

    sudo apt update
    wget -q --content-disposition "https://discord.com/api/download?platform=linux&format=deb"
    sudo apt install ./discord*

  fi
fi

cd /home/$user/Downloads
echo "Downloading BetterDiscord installer..."
wget -q https://github.com/BetterDiscord/Installer/releases/latest/download/BetterDiscord-Linux.AppImage # download BetterDiscord installer
chmod +x ./BetterDiscord-Linux.AppImage # make it executable
echo "Done."

cd /home/$user
mkdir -p .config
cd .config
mkdir -p BetterDiscord
cd BetterDiscord
mkdir -p plugins
cd plugins
echo "Downloading all plugins..."
plugins=(7 11 29 60 61 63 64 65 66 67 68 69 70 71 77 78 80 81 85 88 91 92 94 95 97 98 99 100 103 104 107 109 137 138 139 159 160 162 164 179 181 184 192 193 196 200 220 228 238 240 274 284 291 293 317 337 340 350 351 352 361 364 377 382 383 398 401 407 441 471 500 509 520 523 525 539)
for id in ${plugins[@]}; do # loop through all plugins that sponege hand-picked himself
  echo "Downloading plugin with id $id..."
  wget -q --content-disposition --no-http-keep-alive "https://betterdiscord.app/Download?id=$id" # download all plugins
  # https://unix.stackexchange.com/questions/453465/wget-how-to-download-a-served-file-keeping-its-name
  # https://unix.stackexchange.com/questions/410493/stop-wget-reusing-existing-connection
done
echo "Done."

cd $dotfiles
# usermod --shell $oldshell $user # change shell to what it was previously
echo "Installation script finished."
