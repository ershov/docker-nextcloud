#!/bin/bash

# https://github.com/filebrowser/filebrowser

set -uexo pipefail

mkdir -p /mnt/data/filebrowser/database

test -f /mnt/data/filebrowser/filebrowser.json || cat > /mnt/data/filebrowser/filebrowser.json <<'_E'
{
  "port": 80,
  "baseURL": "",
  "address": "",
  "log": "stdout",
  "database": "/database/filebrowser.db",
  "root": "/srv"
}
_E

test -f /mnt/data/filebrowser/database/custom.css || cat > /mnt/data/filebrowser/database/custom.css <<'_E'
#listing.list .item { padding: 0 !important; }
#listing.list .item div:first-of-type i { font-size: 1.4em !important; }
#listing.list .item div:first-of-type { width: 2em !important; }
nav { width: 12em !important; }
main { width: calc(100% - 15em) !important; }
header { height: 3em !important; }
_E

chmod -R a+wr /mnt/data/filebrowser
sudo docker run -v /mnt/data/data:/srv -v /mnt/data/filebrowser/database:/database -v /mnt/data/filebrowser/filebrowser.json:/.filebrowser.json -u 33:33 -p 8081:80 --name filebrowser -it --rm filebrowser/filebrowser config set --branding.files /database || true
sudo docker run -v /mnt/data/data:/srv -v /mnt/data/filebrowser/database:/database -v /mnt/data/filebrowser/filebrowser.json:/.filebrowser.json -u 33:33 -p 8081:80 --name filebrowser -it --rm filebrowser/filebrowser config set --commands ".*" || true
sudo docker run -v /mnt/data/data:/srv -v /mnt/data/filebrowser/database:/database -v /mnt/data/filebrowser/filebrowser.json:/.filebrowser.json -u 33:33 -p 8081:80 --name filebrowser -it --rm filebrowser/filebrowser users update admin --commands ".*" || true

echo sudo docker run -v /mnt/data/data:/srv -v /mnt/data/filebrowser/database:/database -v /mnt/data/filebrowser/filebrowser.json:/.filebrowser.json -u 33:33 -p 8081:80 --name filebrowser -it --rm filebrowser/filebrowser

