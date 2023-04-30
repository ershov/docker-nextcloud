#!/bin/bash

#sudo DOCKER_BUILDKIT=1 docker build . -t nextcloud-local
#sudo DOCKER_BUILDKIT=1 docker compose build ###

sudo docker compose build
#sudo docker compose up -d

### https://github.com/filebrowser/filebrowser
# mkdir -p /mnt/data/filebrowser/database
# cat > /mnt/data/filebrowser/filebrowser.json <<'_E'
# {
#   "port": 80,
#   "baseURL": "",
#   "address": "",
#   "log": "stdout",
#   "database": "/database/filebrowser.db",
#   "root": "/srv"
# }
# _E
# cat > /mnt/data/filebrowser/database/custom.css <<'_E'
# #listing.list .item { padding: 0 !important; }
# #listing.list .item div:first-of-type i { font-size: 1.4em !important; }
# #listing.list .item div:first-of-type { width: 2em !important; }
# _E
# chmod -R a+wr /mnt/data/filebrowser
# sudo docker run -v /mnt/data/data:/srv -v /mnt/data/filebrowser/database:/database -v /mnt/data/filebrowser/filebrowser.json:/.filebrowser.json -u 33:33 -p 8081:80 --name filebrowser -it --rm filebrowser/filebrowser config set --branding.files /database
# sudo docker run -v /mnt/data/data:/srv -v /mnt/data/filebrowser/database:/database -v /mnt/data/filebrowser/filebrowser.json:/.filebrowser.json -u 33:33 -p 8081:80 --name filebrowser -it --rm filebrowser/filebrowser config set --commands ".*"
# sudo docker run -v /mnt/data/data:/srv -v /mnt/data/filebrowser/database:/database -v /mnt/data/filebrowser/filebrowser.json:/.filebrowser.json -u 33:33 -p 8081:80 --name filebrowser -it --rm filebrowser/filebrowser users update admin --commands ".*"
# sudo docker run -v /mnt/data/data:/srv -v /mnt/data/filebrowser/database:/database -v /mnt/data/filebrowser/filebrowser.json:/.filebrowser.json -u 33:33 -p 8081:80 --name filebrowser -it --rm filebrowser/filebrowser

