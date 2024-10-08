PUID=${PUID:-1000}
PGID=${PGID:-100}
echo "Change owner to user 'qbittorrent' (PUID=$PUID PGID=$PGID)..."
groupmod -o -g "${PGID}" qbittorrent
usermod -o -u "${PUID}" qbittorrent
chown -R qbittorrent:qbittorrent "${QBT_PROFILE}" /data
