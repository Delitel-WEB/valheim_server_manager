#!/bin/bash

# Запуск сервера
start_server(){
    send_message "Запускаем сервер..."
    screen -S $SCREEN_SESSION_NAME -d -m bash $VALHEIM_SERVER_PATH/script.sh
    send_message "Сервер скоро будет доступен по адерсу: $external_ip:2456"
}
