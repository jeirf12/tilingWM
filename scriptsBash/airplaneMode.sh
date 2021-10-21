#!/bin/bash
# Autor: { Fallen }

status=$(nmcli n connectivity)

if [[ "$status" == "limited" ]] || [[ "$status" == "full" ]]; then
  nmcli networking off
  message='Airplane Mode Actived'
else
  nmcli networking on
  message='Airplane Mode Desactived'
fi

sleep 1
notify-send "$message" --icon=dialog-information
