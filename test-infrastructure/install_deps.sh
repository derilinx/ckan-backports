#!/bin/sh

# SOLR
mkdir -p /etc/solr/conf/
ln -s ~/ckan/config/solr/schema.xml /etc/solr/conf/schema.xml

# OS Dependencies
apt update && apt-get -y dist-upgrade
curl -sL https://deb.nodesource.com/setup_16.x | bash -
apt install -y nodejs libgtk2.0-0 libgtk-3-0 libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb postgresql-client
npm install

#Python Dependencies
pip install -r requirements.txt
pip install -r dev-requirements.txt
pip install -e .
pip check
