#!/bin/bash

BIN=/mnt/vg01/local/scripts
DATA=/mnt/vg01/local/data
LOG=/mnt/vg01/local/log

CONFIG=/data/freenas-v1.db 
CFG_COPY="freenas.`date +%Y%m%d`.db"

#REMOTE_SVR=miniMAC
#REMOTE_DIR=/Users/tlehr/Dropbox/DeviceBackups/fs
#REMOTE_USER=tlehr
REMOTE_DIR=/mnt/vg01/owncloud/users/tlehr/files/DeviceBackups/fs

# make local copy
cp -p ${CONFIG} ${DATA}/${CFG_COPY}
cp -p ${CONFIG} ${REMOTE_DIR}/${CFG_COPY}
chmod 644 ${REMOTE_DIR}/${CFG_COPY}
chown 48:48 ${REMOTE_DIR}/${CFG_COPY}

#scp -qp ${CONFIG} ${REMOTE_USER}@${REMOTE_SVR}:${REMOTE_DIR}/${CFG_COPY}

