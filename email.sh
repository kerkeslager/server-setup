set -e

# Set up basic state
cd /home/admin
sudo apt update

# Install packages
sudo apt install -y postfix dovecot
