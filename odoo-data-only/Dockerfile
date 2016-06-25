FROM ubuntu:14.04

MAINTAINER Nhat Nguyen <nminhnhat2008@gmail.com>

# Add odoo user/group with fixed ID
RUN mkdir /data &&\
    addgroup --gid=1000 odoo && adduser --system --uid=1000 --gid=1000 --home /home/odoo --shell /bin/bash odoo &&\
    chown -R odoo:odoo /data

# Create data folder and serve it for usage of other odoo containers
VOLUME ["/data"]