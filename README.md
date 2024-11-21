```bash
#!/bin/bash

# Определение переменных
export BOT_TOKEN="" # ТОКЕН БОТА ТЕЛЕГРАМ
export CHAT_ID="" # ЧАТ В КОТОРЫЙ БОТ БУДЕТ ОТПРАВЛЯТЬ ЛОГИ

MAX_RETRIES=5  # Максимальное количество повторных попыток установки valheim
RETRY_DELAY=15  # Задержка перед повторной попыткой (в секундах)

VALHEIM_SERVER_PATH="$HOME/valheim-server"

GDRIVE_CONFIG_PATH=""
GDRIVE_WORLD_DATA_PATH=""
LOCAL_WORLD_DATA_PATH="$HOME/.config/unity3d/IronGate/Valheim"

export SCREEN_SESSION_NAME="valheim_server"

cat > "$HOME/.config/rclone/rclone.conf" <<EOF
<Конфиг rclone>
EOF

#-------------------------------------------------------------------------------#
apt install git -y
cd
git clone https://github.com/Delitel-WEB/valheim_server_manager.git
#-------------------------------------------------------------------------------#
source $HOME/valheim_server_manager/scripts/send_message.sh
source $HOME/valheim_server_manager/scripts/preparing_server.sh
source $HOME/valheim_server_manager/scripts/download_valheim_server.sh
source $HOME/valheim_server_manager/scripts/get_files_from_drive.sh
source $HOME/valheim_server_manager/scripts/get_server_config_from_drive.sh
source $HOME/valheim_server_manager/scripts/get_server_info.sh
source $HOME/valheim_server_manager/scripts/start_server.sh


download_valheim_server
get_server_config
get_server_info
start_server
```