set -e

if [ $# -lt 3 ]; then
  echo 1>&2 "$0: not enough arguments"
  exit 2
elif [ $# -gt 3 ]; then
  echo 1>&2 "$0: too many arguments"
  exit 2
fi

# Setup basic state
sudo apt update
cd /home/admin

GITREPO=$1
DIRECTORY=$(readlink -f $2)
HOST=$3

# Install apt packages
sudo apt install -y python3-venv

# Clone GITREPO into DIRECTORY
if [ ! -d $DIRECTORY ] ; then
  git clone $GITREPO $DIRECTORY
fi
cd $DIRECTORY
git pull

# Create a virtualenv and install requirements
if [ ! -d .env ] ; then
  python3 -m venv .env
fi
source .env/bin/activate
pip install --upgrade pip wheel
pip install -r requirements.txt

# Install gunicorn
pip install gunicorn
sudo cp /home/admin/server-setup/django-files/gunicorn.socket /etc/systemd/system/gunicorn.socket
cat /home/admin/server-setup/django-files/gunicorn.service | sed "s|__DIRECTORY__|$DIRECTORY|" | sudo tee /etc/systemd/system/gunicorn.service
sudo systemctl daemon-reload

# Start gunicorn
sudo systemctl start gunicorn.socket
sudo systemctl enable gunicorn.socket

# Add an nginx sites_avaialble
cat /home/admin/server-setup/django-files/nginx-site-available | sed "s|__DIRECTORY__|$DIRECTORY|;s|__HOST__|$HOST|" | sudo tee /etc/nginx/sites-available/$HOST
sudo ln -T -s /etc/nginx/sites-available/$HOST /etc/nginx/sites-enabled
