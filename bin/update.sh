#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

nerdctl pull daweedpanic/papermc
wget https://dev.bukkit.org/projects/dynmap/files/latest -O ${SCRIPT_DIR}/../server/plugins/dynmap.jar
wget https://dev.bukkit.org/projects/worldedit/files/latest -O ${SCRIPT_DIR}/../server/plugins/worldedit.jar

ESSENTIALX_VERSION=2.19.7
wget https://github.com/EssentialsX/Essentials/releases/download/${ESSENTIALX_VERSION}/EssentialsX-${ESSENTIALX_VERSION}.jar -O ${SCRIPT_DIR}/../server/plugins/essentialsx.jar
#wget https://github.com/EssentialsX/Essentials/releases/download/${ESSENTIALX_VERSION}/EssentialsXGeoIP-${ESSENTIALX_VERSION}.jar -O ${SCRIPT_DIR}/../server/plugins/essentialsx_geoip.jar
wget https://github.com/EssentialsX/Essentials/releases/download/${ESSENTIALX_VERSION}/EssentialsXSpawn-${ESSENTIALX_VERSION}.jar -O ${SCRIPT_DIR}/../server/plugins/essentialsx_spawn.jar
wget https://github.com/EssentialsX/Essentials/releases/download/${ESSENTIALX_VERSION}/EssentialsXChat-${ESSENTIALX_VERSION}.jar -O ${SCRIPT_DIR}/../server/plugins/essentialsx_chat.jar

wget https://download.luckperms.net/1449/bukkit/loader/LuckPerms-Bukkit-5.4.41.jar -O ${SCRIPT_DIR}/../server/plugins/luckperms.jar

chown min:min -R ${SCRIPT_DIR}/../server/plugins
sudo nerdctl compose -f ${SCRIPT_DIR}/../pmc.yml down
#sleep 5
sudo nerdctl compose -f ${SCRIPT_DIR}/../pmc.yml up -d
