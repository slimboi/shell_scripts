# shell_scripts
Collection of my personal shell scripts

# create_newuser.sh
This script helps to create new users on a linux system along with a default home folder. 
You should run this script with root privileges.  
A .ssh directory is created from running the script after the user is created. 
You should generate a ssh key and then put the public key location in the script so it can be copied to the new user home directory.
To access the new user account use ssh -i privatekey_file username@server_ip

