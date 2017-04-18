FROM httpd:2.4

# add the missing lib in official image
RUN apt-get update \
	&& apt-get install -y libaprutil1-ldap \
	&& rm -r /var/lib/apt/lists/* \
	&& mkdir -p {$HTTPD_PREFIX/certs,$HTTPD_PREFIX/conf.d} \
	&& echo "Include conf.d/*.conf" >> $HTTPD_PREFIX/conf/httpd.conf

VOLUME [$HTTPD_PREFIX/certs, $HTTPD_PREFIX/conf.d]

EXPOSE 80 443