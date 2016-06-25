#!/bin/bash

########### openerp-server.conf ###########
cat << EOF > /etc/odoo/openerp-server.conf
[options]
addons_path = /usr/lib/python2.7/dist-packages/openerp/addons,/data/odoo/$ORG_NAME/extra-addons
data_dir = /data/odoo/$ORG_NAME/filestore
; auto_reload parameter is enabled means, you dont need to restart the server.
; It enables auto-reloading of python files and xml files without having to restart the server.
; It required pyinotify
auto_reload = True
db_host = $ORG_PG_DB_HOST
db_port = $ORG_PG_DB_PORT
db_name = $ORG_PG_DB_NAME
db_user = $ORG_PG_DB_USER
db_password = $ORG_PG_DB_PASSWORD
db_maxconn = 64
; The database management screens are protected by the admin_passwd
; setting. This setting can only be set using configuration files, 
; and is simply checked before performing database alterations
admin_passwd = $ORG_ADMIN_PASS
logfile = /var/log/odoo/$ORG_NAME/odoo-server.log
; csv_internal_sep = ,
; db_maxconn = 64
; db_name = False
; db_template = template1
; dbfilter = .*
; debug_mode = False
; email_from = False
; limit_memory_hard = 2684354560
; limit_memory_soft = 2147483648
; limit_request = 8192
; limit_time_cpu = 60
; limit_time_real = 120
; list_db = True
; log_db = False
; log_handler = [':INFO']
; log_level = info
; logfile = None
; longpolling_port = 8072
; max_cron_threads = 2
; osv_memory_age_limit = 1.0
; osv_memory_count_limit = False
; smtp_password = False
; smtp_port = 25
; smtp_server = localhost
; smtp_ssl = False
; smtp_user = False
; workers = 0
; xmlrpc = True
; xmlrpc_interface = 
; xmlrpc_port = 8069
; xmlrpcs = True
; xmlrpcs_interface = 
; xmlrpcs_port = 8071
EOF