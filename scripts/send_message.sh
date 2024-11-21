#!/bin/bash

# Функция для отправки сообщения в телеграм
send_message() {
    local message="$1"
    curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" \
         -d "chat_id=$CHAT_ID" \
         -d "text=$message"
}