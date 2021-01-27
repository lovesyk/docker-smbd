FROM debian:testing-slim
ENV LANG C.UTF-8

COPY entrypoint.sh /usr/local/sbin/

RUN apt-get update \
 && apt-get -y install --no-install-recommends --no-upgrade samba \
 && rm -rf /var/lib/apt/lists/* \
 && chmod +x /usr/local/sbin/entrypoint.sh

CMD ["entrypoint.sh"]
