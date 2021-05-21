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
    rsync -rltvzP --no-p --no-g --chmod=ugo=rwX --exclude=.@upload_cache --exclude=.streams --exclude=@Recently-Snapshot --exclude=@Recycle --exclude=.@__thumb /source/${dir} rsync://${TARGET_URL}/${dir}
    echo "##############################################"
    echo "# Finished backing up ${dir} #"
    echo "##############################################"
done
