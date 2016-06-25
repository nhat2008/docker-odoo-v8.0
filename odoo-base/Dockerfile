FROM debian:jessie

MAINTAINER Nhat Nguyen <nminhnhat2008@gmail.com>

RUN set -x; \
        apt-get update \
        && apt-get install -y \
            git \
            adduser \
            ca-certificates \
            curl \
            npm \
            python-support \
            python-pyinotify \
            postgresql-client python-dateutil python-decorator python-docutils python-feedparser python-imaging python-jinja2 python-ldap python-libxslt1 python-lxml python-mako python-mock python-openid python-passlib python-psutil python-psycopg2 python-pybabel python-pychart python-pydot python-pyparsing python-pypdf python-reportlab python-requests python-simplejson python-tz python-unittest2 python-vatnumber python-vobject python-werkzeug python-xlwt python-yaml \
        && npm install -g less less-plugin-clean-css \
        && ln -s /usr/bin/nodejs /usr/bin/node \
        && curl -o wkhtmltox.deb -SL http://nightly.odoo.com/extra/wkhtmltox-0.12.1.2_linux-jessie-amd64.deb \
        && echo '40e8b906de658a2221b15e4e8cd82565a47d7ee8 wkhtmltox.deb' | sha1sum -c - \
        && dpkg --force-depends -i wkhtmltox.deb \
        && apt-get -y install -f \
        && rm -rf /var/lib/apt/lists/* wkhtmltox.deb

# We set the openerp user and group fixed for compatibility with connectors and hosts
RUN addgroup --gid=1000 odoo && adduser --system --uid=1000 --gid=1000 --home /home/odoo --shell /bin/bash odoo

# Expose Odoo services (XML-RPC and XML_RPCS)
EXPOSE 8069 8071