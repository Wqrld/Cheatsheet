#!/bin/bash
mkdir -p /backupstore
cd /backupstore
mkdir -p /permbackups
ls -tr /backupstore | head -n -1 | xargs -d '\n' -r rm --
# ^ delete all but last
mv /backupstore/* /permbackups
