FROM ubuntu

ENV SQUID_CACHE_DIR=/var/spool/squid \
    SQUID_LOG_DIR=/var/log/squid \
    SQUID_USER=proxy
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y squid \
 && rm -rf /var/lib/apt/lists/*
COPY start.sh /usr/local/bin/
COPY conf/squid*.conf /etc/squid/
RUN chmod +x /usr/local/bin/start.sh
EXPOSE 3128
ENTRYPOINT ["/usr/local/bin/start.sh"]