# server-setup

This project contains scripts to initialize servers. It's intended to ease some
common tasks that you might do while setting up one or two servers. It's tested
on Debian and will only ever support the latest version of Debian.

It's implemented as a set of bash scripts that you'll run manually. I've made
*some* effort to make the scripts indepotent, but I'm not making any serious
promises there.

All scripts should be run as user `admin`.

## init-root.sh
Most servers will want to log in as root, `git clone` the repo, and run
this script, as all the other scripts depend on this having been run.

* Creates the `admin` user.
* Grants the `admin` user `sudo` privileges.
* Gives the `admin` user the ability to log in over `ssh` with the same `ssh`
  key as the `root` user.

## init.sh
Most servers will want to log in as `admin` and run this immediately after
running the `init-root.sh` script, as everything else depends on this having
been run.

* Install ufw and configure it to only allow SSH

## nginx.sh
* Install nginx.
* Configure ufw to allow you to connect to Nginx over HTTP and HTTPS.

## django.sh GITREPO DIRECTORY HOST
* Run nginx.sh
* Clone GITREPO into DIRECTORY
* 

