FROM mosaiksoftware/debian:onbuild
MAINTAINER  Chrisitan Holzberger <ch@mosaiksoftware.de>


COPY tools/setup-db.sh /sbin/setup-db
COPY tools/wait-for-tcp-socket.sh /bin/wait-for-tcp-socket
RUN chmod a+x /sbin/setup-db
RUN chmod a+x /bin/wait-for-tcp-socket
##### PACKAGE INSTALLATION #####

RUN begin-apt && \
	rm /etc/apt/preferences.d/nosystemd.pref && \
	set-selections systemd  && \
	set-selections php5-nginx jessie-backports && \
	set-selections zoneminder jessie-backports && \
	end-apt && \
	ln -sf /etc/nginx/sites-available/zoneminder /etc/nginx/sites-enabled/default
RUN chown -R www-data:www-data /usr/share/zoneminder/
RUN chown www-data:www-data /etc/zm/zm.conf
RUN rm /etc/php5/fpm/pool.d/www.conf

VOLUME ["/var/lib/mysql/","/var/cache/zoneminder/"]
COPY tools/setup-container.sh /bin/setup-container
RUN chmod a+x /bin/setup-container
#################################
CMD /bin/setup-container && exec /usr/bin/supervisord -n -c /etc/supervisord.conf
