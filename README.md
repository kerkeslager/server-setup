# server-setup

This project contains scripts to initialize servers. It's intended to ease some
common tasks that you might do while setting up one or two servers. It's tested
on Debian and will only ever support the latest version of Debian.

It's implemented as a set of bash scripts that you'll run manually. I've made
*some* effort to make the scripts indepotent, but I'm not making any serious
promises there.

## init-root.sh
Most servers will want to log in as root, `git clone` the repo, and run
this script, as all the other scripts depend on this having been run.
