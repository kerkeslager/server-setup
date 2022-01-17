set -e

# Add a user `admin`
if id -u admin > /dev/null 2>&1; then
  adduser admin
  usermod -aG sudo admin
fi


# Allow the `admin` user to log in over ssh
if [ ! -d /home/admin/.ssh ]; then
  cp -r ~/.ssh /home/admin
  chown -R admin:admin /home/admin/.ssh
fi



