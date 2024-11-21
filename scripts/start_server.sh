#!/bin/bash

# Запуск сервера
start_server(){
    send_message "Запускаем сервер..."
    cd $VALHEIM_SERVER_PATH
    screen -S $SCREEN_SESSION_NAME -d -m bash $VALHEIM_SERVER_PATH/start_server.sh
    send_message "Сервер скоро будет доступен по адерсу: $external_ip:2456"
}
