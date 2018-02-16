#!/bin/bash

if ! id -u dev &> /dev/null; then
        groupadd -o -g $CLOUD9_GID dev
        useradd -o -d /home/dev -g $CLOUD9_GID -u $CLOUD9_UID dev
        gpasswd -a dev sudo
        echo "dev:dev" | chpasswd
fi

chown dev:dev /tmp/ssh_auth_sock
supervisord -c /etc/supervisor/supervisord.conf
