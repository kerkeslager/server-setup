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
DIRECTORY=$2
HOST=$3

if [ ! -d $DIRECTORY ] ; then
  git clone $GITREPO $DIRECTORY
fi

cd $DIRECTORY
git pull

if [ ! -d .env ] ; then
  python3 -m venv .env
fi

