# Tinyproxy (https://banu.com/tinyproxy/)
FROM alpine:latest

# Install tini and tinyproxy
RUN apk add --no-cache tini tinyproxy

COPY tinyproxy.conf /etc/tinyproxy/tinyproxy.conf

EXPOSE 3128

RUN tinyproxy -v

# Use tini as the init system to handle signals properly
ENTRYPOINT ["/sbin/tini", "--"]

USER nobody
# Run tinyproxy in the foreground
CMD ["tinyproxy", "-d"]
