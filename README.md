# qnap-nas-backup
This repo contains Docker components for backing up your QNAP NAS within a LAN.
It uses `rsync` and *Docker*.

## Setup and Usage
1. Connect to your NAS via ssh and clone this repository. (If you haven't 
installed *git* yet, 
[this blog entry (https://sdhuang32.github.io/install-git-on-qts/)](https://sdhuang32.github.io/install-git-on-qts/) 
helped me making it work.)
1. Open `docker-compose.yml` in your preferred text editor.
1. Under `environment:` you'll find 5 variables.
    * Edit `PUID` / `GUID`, if you're using a specific user for Docker tasks.
    Otherwise you may delete these.
    * `TZ` specifies the utilized timezone within the container.
    * Shared folders on *QTS* are stored under `/share`. This directory is 
    mounted as volume into the container. Add your preferred subdirectories 
    to `BACKUP_DIRS`. **NOTE**: These directories **have to be separated by 
    , (commas)** and will be backed up.
    * `TARGET_ADDRESS` has to be a *IPv4* address within your local network.
1. Start backing up by typing `docker-compose --compatibility up -d`.

## Customization
If you would like to back up different directories, feel free to adjust 
`backup.sh` to your needs. Don't forget to mount these directories as volumes.

## Contributing
PRs, feedback and improvement suggestions are very welcome! :)
