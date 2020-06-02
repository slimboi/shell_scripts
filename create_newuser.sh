#!/bin/bash

ROOT_UID=0
SUCCESS=0
E_USEREXISTS=70

# Run as root, of course. (this might not be necessary, because we have to run the script somehow with root anyway)
if [ "$UID" -ne "$ROOT_UID" ]
then
  echo "Must be root to run this script."
  exit $E_NOTROOT
fi 

# Am i Root user?
if [ $(id -u) -eq 0 ]; then
 read -p "Enter username : " username
 egrep "^$username" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
echo "$username exists! Please login with ssh key"
exit 1
else
useradd -m "$username"
echo "User $username has been added to system! Please login with ssh key"
fi
fi

# Create a new .ssh directory in the home folder
sudo mkdir /home/$username/.ssh

# Copy the public key from my home directory to the new user directory
sudo cp /home/ofagbule/user.pub /home/$username/.ssh/authorized_keys

# Change the ownership of the .ssh folder
sudo chown -R $username: /home/$username/.ssh/

# Use this command to access the new user account using ssh
ssh -i privatekey_file username@server_ip
