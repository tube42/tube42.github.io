#!/bin/sh

# install minimal stuff
sudo apt-get install --no-install-recommends -y ufw tmux openssh-server openssh-client vim wget

# initial system setup
sudo ufw allow 22/tcp
sudo ufw enable

sed -i 's|[#]*PasswordAuthentication no|PasswordAuthentication yes|g' /etc/ssh/sshd_config
sed -i 's|UsePAM no|UsePAM yes|g' /etc/ssh/sshd_config
/etc/init.d/ssh restart


# add temporary keys
mkdir ${HOME}/.ssh
echo ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA1krlFQkL3kUNofewKJiRN+k7rfd1A2xrAqLPj43shDfugKIOrSoCo2dsmJOfTpHRBHKbG3cXCU0t2J0EzV1aJhboRK5dI5j+FILp/nAQAF36vEDB6GY2I43vjETZLSj5dzjs/qDLu6J5RtGCdLa0o2WnPLGn/zA8veLoiA56KJVT1KBVrA9QSXqGNj3yd1DzqldsrmfzIbSRfjW7ZnzbLX3iCIjJJt+1uoGt4/EfQEyjLQX2GnT+tphdVwO8HVSHSs9miUeTj88HDezybiTPBDqvbD0X6dsL4HIIC6E8Ostqy8vVEfkWd9BsrpuSlxNpZT9BQ2FXja3be+tHIjb5Iw== a key... > ${HOME}/.ssh/authorized_keys
chmod 400 ${HOME}/.ssh/*
chmod 700 ${HOME}/.ssh


# temporary structure and files
mkdir ${HOME}/tmp
mkdir ${HOME}/bin

cat << EOF > ${HOME}/tmux.conf
set -g mode-mouse on
set -g mouse-resize-pane on
set -g mouse-select-pane on
set -g mouse-select-window on
EOF

