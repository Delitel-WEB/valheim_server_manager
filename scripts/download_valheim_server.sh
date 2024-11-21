#!/bin/bash

# Функция для загрузки и проверки статуса
download_valheim() {
    local retries=0

    while [ $retries -lt $MAX_RETRIES ]; do
        send_message "Попытка $((retries + 1)): Начинаю загрузку Valheim Server..."

        ./steamcmd.sh +force_install_dir $VALHEIM_SERVER_PATH +login anonymous +app_update 896660 validate +quit
        local status=$?

        if [ $status -eq 0 ]; then
            send_message "Загрузка Valheim Server завершена успешно."
            return 0
        else
            send_message "Ошибка при загрузке Valheim Server. Попытка $((retries + 1)) не удалась."
            rm -R $VALHEIM_SERVER_PATH
            retries=$((retries + 1))
            sleep $RETRY_DELAY
        fi
    done

    send_message "Загрузка Valheim Server не удалась после $MAX_RETRIES попыток."
    return 1
}