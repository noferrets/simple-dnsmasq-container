FROM alpine:latest

LABEL org.opencontainers.image.created="2021-02-23" \
      org.opencontainers.image.authors="hello@noferrets.uk" \
      org.opencontainers.image.url="https://github.com/noferrets/dnsmasq" \
      org.opencontainers.image.documentation="https://github.com/noferrets/dnsmasq/README.md" \
      org.opencontainers.image.source="https://github.com/noferrets/dnsmasq" \
      org.opencontainers.image.version="1.0.0" \
      org.opencontainers.image.vendor="Martyn Skene Ashworth" \
      org.opencontainers.image.licenses="MIT License" \
      org.opencontainers.image.title="dnsmasq" \
      org.opencontainers.image.description="Simple Alpine + Dnsmasq image"

RUN apk add --no-cache \
        dnsmasq \
    && mkdir -p /opt/dnsmasq/conf.d \
    && chown -R dnsmasq:dnsmasq /opt/dnsmasq

USER dnsmasq

COPY dnsmasq.conf /opt/dnsmasq/dnsmasq.conf

VOLUME [ "/opt/dnsmasq/conf.d" ]
EXPOSE 53

CMD [ "dnsmasq", "-d", "-C", "/opt/dnsmasq/dnsmasq.conf" ]
