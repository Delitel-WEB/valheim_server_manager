#!/bin/bash

get_server_config(){
    # Проверека конфигурации сервера
    send_message "Проверяем наличие конфигурации сервера."
    if rclone lsf "$GDRIVE_CONFIG_PATH" > /dev/null; then
        send_message "Скачиваем конфиг сервера."
        rclone copy "$GDRIVE_CONFIG_PATH" "$VALHEIM_SERVER_PATH"
    else
        send_message "Конфиг сервера отсутствует. Он будет установлен по умолчанию!"
    fi
}
