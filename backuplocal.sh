#!/bin/bash
SQLPASS=
BACKUPHOST=127.0.0.1
CDATE=`date +"%d-%m-%y-%H-%M"`

mkdir -p /backup
cd /backup

#start backups
mysqldump --all-databases --password=${SQLPASS} -u root > database.sql
screen -S skyblock -X stuff 'save-off^Msave-all^M'
sleep 10
cp /home/skyblock /backup/skyblock -r
cd /
tar -czvf "skyblock${CDATE}backup.tar.gz" backup

#transfer
sleep 5
ssh ${BACKUPHOST} "mkdir /backupstore"
sleep 3
scp -r skyblock${CDATE}backup.tar.gz ${BACKUPHOST}:/backupstore


#removals
sleep 5
screen -S skyblock -X stuff 'save-on^Msave-all^M'
rm -rf /backup/*
rm skyblock${CDATE}backup.tar.gz
