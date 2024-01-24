#!/bin/bash

echo "copy config to nxinx"
cp wireguard.conf /etc/nginx/sites-available/

echo "linking config to enabled"
ln -s /etc/nginx/sites-available/wireguard.conf /etc/nginx/sites-enabled/
