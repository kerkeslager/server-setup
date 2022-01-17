set -e

# Basic state setup
sudo apt update
cd /home/admin

# Install nginx
sudo apt install nginx

# Configure the firewall
sudo ufw allow 'Nginx Full'


