#!/bin/bash
#script_2.sh
N=5
i=1
pas=password
cd /home/super_user
fallocate temp_file -l 102400

while [ $i -le $N ]
do
useradd -g test_group -G my_group -c "test users" "test$i"; 
echo $pas | passwd "test$i" --stdin;

if grep test$i /etc/passwd
then
	echo "The user test$i was created, so it exists by now."
fi

sudo cp temp_file /home/test$i

((i=i+1))

done

sudo chown test1:my_group /home/super_user/temp_file
sudo chmod 345 /home/super_user/temp_file

i=1
while [ $i -le $N ]
do
sudo userdel -r test$i
((i=i+1))

done
sudo groupdel test_group
sudo groupdel my_group

sudo sed -i '/super_user ALL=(ALL:ALL)/d' /etc/sudoers


