# qnap-nas-backup
This repo contains Docker components for backing up your QNAP NAS within a LAN.
It uses `rsync` and *Docker*.  
*NOTE*: There has to be a `rsync` daemon running within your LAN.

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
    mounted as a container volume. Add your preferred subdirectories 
    to `BACKUP_DIRS`. **NOTE**: These directories **have to be separated by 
    , (commas)** and will be backed up later on.
    * `TARGET_URL`: URL to your `rsync` daemon directory.
1. Start syncing by typing `sh run.sh`.

## Customization
If you would like to back up or restore different directories, feel free to adjust 
`backup.sh`, `restore.sh` or `Makefile` to your needs. Don't forget to mount 
these directories as volumes and **adjust the `make` invocation in the Dockerfile**.

## Contributing
PRs, feedback and improvement suggestions are very welcome! :)
