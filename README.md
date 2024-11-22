```bash
#!/bin/bash

# Определение переменных
export BOT_TOKEN="" # ТОКЕН БОТА ТЕЛЕГРАМ
export CHAT_ID="" # ЧАТ В КОТОРЫЙ БОТ БУДЕТ ОТПРАВЛЯТЬ ЛОГИ

MAX_RETRIES=5  # Максимальное количество повторных попыток установки valheim
RETRY_DELAY=15  # Задержка перед повторной попыткой (в секундах)

VALHEIM_SERVER_PATH="$HOME/valheim-server"

GDRIVE_CONFIG_PATH=""
export GDRIVE_WORLD_DATA_PATH=""
export LOCAL_WORLD_DATA_PATH="$HOME/.config/unity3d/IronGate/Valheim"

RCLONE_CONFIG_NAME=""
RCLONE_CONFIG_TYPE=""
RCLONE_CLIENT_ID=""
RCLONE_CLIENT_SECRET=""
RCLONE_SCOPE=""
RCLONE_TOKEN=""

export SCREEN_SESSION_NAME="valheim_server"


#-------------------------------------------------------------------------------#
apt update
apt install git -y
cd $HOME
git clone https://github.com/Delitel-WEB/valheim_server_manager.git
#-------------------------------------------------------------------------------#
source $HOME/valheim_server_manager/scripts/send_message.sh
source $HOME/valheim_server_manager/scripts/preparing_server.sh
source $HOME/valheim_server_manager/scripts/download_valheim_server.sh
source $HOME/valheim_server_manager/scripts/get_files_from_drive.sh
source $HOME/valheim_server_manager/scripts/get_server_config_from_drive.sh
source $HOME/valheim_server_manager/scripts/get_server_info.sh
source $HOME/valheim_server_manager/scripts/start_server.sh



download_valheim
get_server_config
get_server_info
start_server

screen -S "watch_dog" -d -m bash $HOME/valheim_server_manager/scripts/sync_data.sh
```