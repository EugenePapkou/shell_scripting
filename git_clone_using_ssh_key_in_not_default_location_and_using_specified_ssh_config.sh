#!/bin/bash

echo "Cloning settings..."
cat << EOF > /home/user/.ssh/temp_config
Host host-free-tier.amazon.com
  StrictHostKeyChecking no
EOF
chmod 600 /home/user/.ssh/temp_config

touch /home/user/.ssh/config
echo 'Include /home/user/.ssh/temp_config' | cat - /home/user/.ssh/config > temp && mv temp /home/user/.ssh/config
chmod 600 /home/user/.ssh/config

ssh-agent sh -c "ssh-add /home/user/ssh.key; git clone address_repo1_github repo1_local_copy"

#restore initial ssh settings
rm /home/user/.ssh/temp_config
sed -ri '/Include \/home\/user\/.ssh\/temp_config/d' /home/user/.ssh/config


