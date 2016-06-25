#!/bin/bash

CONFIG_FOLDER=/tmp/dynamic-configs
FILESPEC=*.sh

for SCRIPT in $CONFIG_FOLDER/$FILESPEC
do
    if [ -x $SCRIPT ]
    then
    echo "Executing : $SCRIPT"
    . $SCRIPT
    fi
done

chown odoo /etc/odoo/openerp-server.conf

if [ ! -d /data/odoo/$ORG_NAME/extra-addons ]; then
    mkdir -p /data/odoo/$ORG_NAME/extra-addons
    if [ ! -d /data/odoo/$ORG_NAME/filestore ]; then
        mkdir -p /data/odoo/$ORG_NAME/filestore
    fi
    chown -R odoo /data/odoo
fi

# case "$1" in
# 	--)
# 		shift
# 		su -c 'exec openerp-server "$@"' odoo
# 		;;
# 	-*)
# 		su -c 'exec openerp-server "$@"' odoo
# 		;;
# 	*)
#         su -c 'exec "$@"' odoo
# esac

# Create log folder
mkdir -p /var/log/odoo/$ORG_NAME

su -c 'exec openerp-server --without-demo=$WITHOUT_DEMO --load-language=$LOAD_LANGUAGES --timezone=$SERVER_TIMEZONE --no-database-list --init=$INIT_MODULES' odoo

exit 1
