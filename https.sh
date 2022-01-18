set -e

if [ $# -lt 1 ]; then
  echo 1>&2 "$0: not enough arguments"
  exit 2
elif [ $# -gt 1 ]; then
  echo 1>&2 "$0: too many arguments"
  exit 2
fi

# setup basic state
sudo apt update
cd /home/admin

HOST=$1

# Install certbot
sudo apt install -y python3-certbot-nginx

# Get certificate
sudo certbot -n --agree-tos --nginx -d $HOST
