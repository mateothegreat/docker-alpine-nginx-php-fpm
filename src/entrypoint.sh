#!/bin/sh

#
# Start nginx
#
/usr/sbin/nginx &

#
# Start php-fpm and keep in the foreground to keep docker container running
#
/usr/sbin/php-fpm7 -F