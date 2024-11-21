#!/bin/bash

# Проверяем наличие файлов сервера на облачном диске
send_message "Проверяем наличие файлов сервера на облачном диске."

if rclone lsf "$GDRIVE_WORLD_DATA_PATH" > /dev/null; then
    send_message "Скачиваем файлы сервера."
    rclone copy "$GDRIVE_WORLD_DATA_PATH" "$LOCAL_WORLD_DATA_PATH"
else
    send_message "Файлов сервера не найдено на гугл диске.\r\nМир будет сгенерирован заного."
fi