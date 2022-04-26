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

    sudo pacman -S paru # pacman but with AUR

    packages=(
    discord # for chatting
    w3m lynx # both w3m and lynx are cool terminal browsers B)
    atom apm # best text editor
    nodejs npm # languages I find to be fast and easy to use
    gimp # image manipulation is a great tool to have
    cava # console-based audio visualizer
    polybar # sexy status bar
    gnome-terminal-transparency # because transparency is sick
    alacritty # gnome-terminal but multiplatform and no top or scroll bar :)
    minecraft-launcher # because XD
    python3 python-pip # neovim uses python???
    i3-gaps # the WM I use :)
    btop htop # task managers :)
    cmatrix # IM SUCH A HACKER GUYS
    )

    for package in ${packages[@]}; do
      paru -S $package --needed # install all packages, if already installed dont reinstall
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

    python -m pip install neovim

  elif [ -f /bin/apt ]; then

    sudo apt update
    wget -q --content-disposition "https://discord.com/api/download?platform=linux&format=deb"
    sudo apt install ./discord*

  fi

  # install prettier
  npm install --save-dev --save-exact prettier
  # support for vim
  mkdir -p ~/.vim/pack/plugins/start
git clone https://github.com/prettier/vim-prettier ~/.vim/pack/plugins/start/vim-prettier

  # Install vim-plug for Neovim (~/.local/share/nvim/site/autoload)
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  
  echo "Installing Nerd Fonts..."
  sudo cp $dotfiles/FiraCode /usr/share/fonts
  ## reset font cache
  fc-cache -f -v

  echo "Installing starship..."
  ## install starship
  curl -sS https://starship.rs/install.sh | sh

  echo "Installing Vundle..."
  ## install Vundle
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

  ## Download sponeges favorite plugins :)
  cd /home/$user/.config/BetterDiscord

  cd /home/$user/Downloads
  echo "Downloading BetterDiscord installer..."
  wget -q https://github.com/BetterDiscord/Installer/releases/latest/download/BetterDiscord-Linux.AppImage # download BetterDiscord installer
  chmod +x ./BetterDiscord-Linux.AppImage # make it executable
  echo "Done."

  mkdir -p plugins
  cd plugins
  echo "Downloading all plugins..."
  plugins=(193 361 220 200 9)
  for id in ${plugins[@]}; do # loop through all plugins that sponege hand-picked himself
    echo "Downloading plugin with id $id..."
    wget -q --content-disposition --no-http-keep-alive "https://betterdiscord.app/Download?id=$id" # download all plugins
    # https://unix.stackexchange.com/questions/453465/wget-how-to-download-a-served-file-keeping-its-name
    # https://unix.stackexchange.com/questions/410493/stop-wget-reusing-existing-connection
  done
  echo "Done."

  ## custom shell prompt, aliases
  cat $dotfiles/initbash.sh >> .bashrc

  ## use 100% of swap memory
  echo "Setting up swap memory..."
  sudo cp $dotfiles/sysctl.conf /etc
  sudo sysctl vm.swappiness=100

fi

echo "Installing alacritty config... (custom background + transparency)"
cd ~
mkdir -p .config
cd .config
mkdir -p alacritty
cd alacritty
cp $dotfiles/alacritty.yml .

echo "Installing jordans/liams neovim configuration..."
cp $dotfiles/.vimrc ~
mkdir -p ~/.config/nvim
cp $dotfiles/nvim/* ~/.config/nvim/* -r

echo "Installing Lowpolys Discord Nord theme..."
## Install Lowpolys sexy Nord Theme
cd ~/.config
mkdir -p BetterDiscord
cd BetterDiscord
mkdir -p themes
cd themes
cp $dotfiles/lowpoly.theme.css .

echo "Installing Lowpolys i3 theme..."
## Install Lowpolys i3 theme + background of my choice
cd ~/.config
mkdir -p i3
cp $dotfiles/i3/* ~/.config/i3
cp $dotfiles/picom.conf ~/.config

echo "Installing jordans polybar config..."
cp $dotfiles/polybar.ini ~/.config/polybar/config.ini

cd $dotfiles
# usermod --shell $oldshell $user # change shell to what it was previously
echo "Installation script finished."
