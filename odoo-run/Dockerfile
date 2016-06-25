#image: odoo_unmodified:8.0
FROM odoo_base:8.0

MAINTAINER Nhat Nguyen <nminhnhat2008@gmail.com>

# Install Odoo
ENV ODOO_VERSION 8.0
ENV ODOO_RELEASE 20150303

RUN set -x; \
        mkdir -p /var/lib/odoo \
        && curl -o odoo.deb -SL http://nightly.odoo.com/${ODOO_VERSION}/nightly/deb/odoo_${ODOO_VERSION}.${ODOO_RELEASE}_all.deb \
        && dpkg --force-depends -i odoo.deb \
        && apt-get update \
        && apt-get -y install -f --no-install-recommends \
        && rm -rf /var/lib/apt/lists/* odoo.deb

# Set the default config file
ENV OPENERP_SERVER /etc/odoo/openerp-server.conf

# Set default user when running the container
# USER odoo

# Copy dynamic configuration
COPY ./dynamic-configs/ /tmp/dynamic-configs/
RUN chmod +x /tmp/dynamic-configs/*

# Copy entrypoint script
COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

# CMD ["openerp-server"]