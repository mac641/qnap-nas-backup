#!/bin/bash

# convert comma separated string from docker-compose.yml into shell array
oIFS="$IFS"; IFS=','
read -r -a dirs <<<"${BACKUP_DIRS}"
IFS="$oIFS"

for dir in "${dirs[@]}"; do
    echo "###################################"
    echo "# Restoring ${dir} #"
    echo "###################################"
    rsync -rlDtvzP --no-p --no-g --chmod=Du=rwx,Dgo=rx,Fu=rw,Fgo=r --exclude=.@upload_cache --exclude=.streams --exclude=@Recently-Snapshot --exclude=@Recycle --exclude=.@__thumb rsync://${TARGET_URL}/${dir} /source/${dir}
    echo "##############################################"
    echo "# Finished restoring ${dir} #"
    echo "##############################################"
done
