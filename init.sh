set -e

# Some basic making sure we're in the right state
sudo apt update
cd /home/admin

# Install apt packages
sudo apt install ufw

# Configure ufw
sudo ufw allow OpenSSH
sudo ufw enable
