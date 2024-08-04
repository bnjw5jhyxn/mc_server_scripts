#!/usr/bin/sh
cd $MINECRAFT_DIR
java -Xms4G -Xmx4G -jar fabric-server-mc.$MINECRAFT_VER-loader.$FABRIC_LOADER_VER-launcher.$FABRIC_INSTALLER_VER.jar nogui
