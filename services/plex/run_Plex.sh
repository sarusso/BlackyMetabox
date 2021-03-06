#!/bin/bash
# Original conf
#cat /etc/systemd/system/plexmediaserver.service
#[Unit]
#Description=Plex Media Server for Linux
#After=network.target

#[Service]
#Environment="PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR=/var/lib/plexmediaserver/Library/Application Support"
#Environment=PLEX_MEDIA_SERVER_HOME=/usr/lib/plexmediaserver
#Environment=PLEX_MEDIA_SERVER_MAX_PLUGIN_PROCS=6
#Environment=PLEX_MEDIA_SERVER_TMPDIR=/tmp
#Environment=LD_LIBRARY_PATH=/usr/lib/plexmediaserver
#Environment=LC_ALL=en_US.UTF-8
#Environment=LANG=en_US.UTF-8
#ExecStartPre=/bin/sh -c '/usr/bin/test -d "${PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR}" || /bin/mkdir -p "${PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR}"'
#ExecStart=/bin/sh -c '/usr/lib/plexmediaserver/Plex\ Media\ Server'
#Type=simple
#User=plex
#Group=plex
#Restart=on-failure
#RestartSec=5
#StartLimitInterval=60s
#StartLimitBurst=3


# Plex env
export PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR="/home/media/Library/Application Support"
export PLEX_MEDIA_SERVER_HOME=/usr/lib/plexmediaserver
export PLEX_MEDIA_SERVER_MAX_PLUGIN_PROCS=6
export PLEX_MEDIA_SERVER_TMPDIR=/tmp
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Library path setup
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/plexmediaserver

# Call executable
/usr/lib/plexmediaserver/Plex\ Media\ Server
