#!/bin/bash


BASEDIR=$(dirname "$0")
>&2 echo "Using basedir \"$BASEDIR\""

# Libwrap support
>&2 echo "Checking for libwrap support in sshd"
ldd $(which sshd) | grep libwrap
libwrap_success=$?
if [[ $libwrap_success != 0 ]]; then
	>&2 echo "Libwrap not found!"
	exit 1
fi


# Cron support
>&2 echo "Checking for existing /etc/cron.daily"
if [ ! -d /etc/cron.daily ]; then
	>&2 echo "Missing cron.daily directory!"
	exit 1
fi


if [[ "$UID" != 0 ]]
then
	>&2 echo "This script must be run as root!"
	exit 1
fi

>&2 echo "Installing blocklist.de into hosts.deny"
mkdir /etc/blocklist.de/
cp $BASEDIR/../system/cron.daily/blocklist-de /etc/cron.daily/blocklist-de
chmod +x /etc/cron.daily/blocklist-de
/etc/cron.daily/blocklist-de

cat <<'EOF' >> /etc/hosts.deny 

# blocklist.de publishes a list of the worst IPs that result in the
# most attacks. We block these IPs here
# The file should be refreshed daily by a CRON job in
# /etc/cron.daily/blocklist-de
ALL: /etc/blocklist.de/strongips.txt
# And the ssh-specific hosts:
sshd: /etc/blocklist.de/ssh.txt
EOF

>&2 echo "Installing spamhaus DROP list into hosts.deny"
mkdir /etc/spamhaus/
cp $BASEDIR/../system/cron.daily/spamhaus-org /etc/cron.daily/spamhaus-org
chmod +x /etc/cron.daily/spamhaus-org
/etc/cron.daily/spamhaus-org

cat <<'EOF' >> /etc/hosts.deny

# Spamhaus' DROP (Don't Route Or Peer) list of bad hosts
# This list is refreshed daily by a CRON job in
# /etc/cron.daily/spamhaus-org
ALL: /etc/spamhaus/drop.lasso
EOF

>&2 echo "Success!"
