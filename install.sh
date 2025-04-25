#!/bin/bash

echo "Instalando $SERVER_TYPE $MC_VERSION..."

case "$SERVER_TYPE" in
  paper)
    DOWNLOAD_URL="https://api.papermc.io/v2/projects/paper/versions/$MC_VERSION/builds/latest/downloads/paper-$MC_VERSION.jar"
    ;;
  vanilla)
    DOWNLOAD_URL="https://launcher.mojang.com/v1/objects/$(curl -s https://launchermeta.mojang.com/mc/game/version_manifest.json | jq -r --arg v "$MC_VERSION" '.versions[] | select(.id==$v) | .url' | xargs curl -s | jq -r '.downloads.server.url')"
    ;;
  purpur)
    DOWNLOAD_URL="https://api.purpurmc.org/v2/purpur/$MC_VERSION/latest/download"
    ;;
  fabric)
    DOWNLOAD_URL="https://meta.fabricmc.net/v2/versions/loader/$MC_VERSION/0.14.21/server/jar"
    ;;
  *)
    echo "Tipo de servidor inválido!"
    exit 1
    ;;
esac

curl -o server.jar "$DOWNLOAD_URL"
