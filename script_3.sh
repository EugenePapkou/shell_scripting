#!/bin/bash
#script_3.sh
groupadd test_group
groupadd my_group
useradd -d /home/super_user -s /bin/bash super_user
echo "password" | passwd super_user --stdin
echo "super_user ALL=(ALL:ALL)        NOPASSWD: ALL" >> /etc/sudoers

sudo -u super_user /bin/bash << blablablaEOF
sudo '/root/script_2.sh'
blablablaEOF
sudo userdel -r super_user

