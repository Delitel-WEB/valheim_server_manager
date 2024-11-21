#!/bin/bash

WATCH_DIR=$LOCAL_WORLD_DATA_PATH
RCLONE_REMOTE=$GDRIVE_WORLD_DATA_PATH

STATE_FILE="/tmp/folder_changes.state"

CHECK_INTERVAL=10

# Функция для получения контрольной суммы содержимого папки
calculate_checksum() {
    find "$WATCH_DIR" -type f -exec sha256sum {} \; | sha256sum | awk '{print $1}'
}

while true; do
    if [[ -f "$STATE_FILE" ]]; then
        CURRENT_CHECKSUM=$(calculate_checksum)
        PREVIOUS_CHECKSUM=$(cat "$STATE_FILE")

        if [[ "$CURRENT_CHECKSUM" != "$PREVIOUS_CHECKSUM" ]]; then
            echo "Обнаружены изменения в папке. Синхронизируем с облаком..."
            
            rclone sync "$WATCH_DIR" "$RCLONE_REMOTE" --progress
            echo "Синхронизация завершена."
        else
            echo "Изменений не обнаружено."
        fi
    else
        echo "Создание первоначального состояния..."
        calculate_checksum > "$STATE_FILE"
    fi

    calculate_checksum > "$STATE_FILE"

    sleep "$CHECK_INTERVAL"
done
