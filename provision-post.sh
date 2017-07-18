#!/usr/bin/env bash

set -ex

if [ -e /vagrant/wordpress.sql ]; then
  sudo -u vagrant -- wp db import /vagrant/wordpress.sql
fi
