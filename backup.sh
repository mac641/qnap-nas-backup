#!/bin/bash

# convert comma separated string from docker-compose.yml into shell array
oIFS="$IFS"; IFS=','
read -r -a dirs <<<"${BACKUP_DIRS}"
IFS="$oIFS"

# back up
for dir in "${dirs[@]}"; do
    echo "####################################"
    echo "# Backing up ${dir} #"
    echo "####################################"
    rsync -avzP --exclude=.@upload_cache --exclude=.streams --exclude=@Recently-Snapshot --exclude=@Recycle --exclude=.@__thumb /source/${dir}/ rsync://${TARGET_ADDRESS}:873/Backup/${dir}
    echo "##############################################"
    echo "# Finished backing up ${dir} #"
    echo "##############################################"
done