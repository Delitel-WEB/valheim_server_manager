#!/bin/bash

get_server_info(){
    #Получение IP сервера
    external_ip=$(curl -s https://api.ipify.org)
    send_message "Внешний IP-адрес сервера: $external_ip"
}