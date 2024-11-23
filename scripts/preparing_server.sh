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
sudo apt install rclone -y

send_message "Установка конфига rclone $HOME/.config/rclone/rclone.conf"
mkdir -p "$HOME/.config/rclone"
cat > "$HOME/.config/rclone/rclone.conf" <<EOF
$RCLONE_CONFIG_NAME
type = $RCLONE_CONFIG_TYPE
client_id = $RCLONE_CLIENT_ID
client_secret = $RCLONE_CLIENT_SECRET
scope = $RCLONE_SCOPE
token = $RCLONE_TOKEN
EOF