#!/bin/sh
# NAS support
sudo apt-get install --no-install-recommends -y cifs-utils
# sudo apt-get install --no-install-recommends -y smbclient


cat << EOF > ${HOME}/bin/nas.example
#!/bin/sh
# this is just an example, change it to your liking

sudo mount -t cifs //<NAS IP>/<NAS SHARRE> /mnt/<MOUNT POINT> -o iocharset=utf8,user=user,uid=user,gid=users


EOF
