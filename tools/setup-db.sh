#!/bin/bash

mysql < /usr/share/zoneminder/db/zm_create.sql
mysql -e "grant select,insert,update,delete,create on zm.* to 'zmuser'@localhost identified by 'zmpass';"
