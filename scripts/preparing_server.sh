#!/bin/bash

source $HOME/valheim_server_manager/scripts/send_message.sh


# Установка screen
send_message "Установка screen"
apt install screen -y

# Установка зависимостей
send_message "Установка зависимостей"
sudo apt update
sudo apt install htop -y
sudo apt install libatomic1 libpulse-dev libpulse0 -y
sudo apt-get install lib32gcc-s1 curl -y 

mkdir ~/steamcmd
cd ~/steamcmd

# Установка Steam
send_message "Установка Steam"
curl -o steamcmd_linux.tar.gz https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
tar -xvzf steamcmd_linux.tar.gz -C ~/steamcmd
rm steamcmd_linux.tar.gz


# Установка rclone
send_message "Установка rclone"
config_path="$HOME/.config/rclone/rclone.conf"
sudo apt install rclone -y
send_message "Установка конфига rclone"
echo "$RCLONE_CONFIG" | cat > "$config_path"
