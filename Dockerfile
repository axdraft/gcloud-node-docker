FROM node:12-alpine
# Get the necessary build tools
RUN apk update && apk add python3 py3-pip chromium chromium-chromedriver && pip3 install awscli \
&& rm -rf /var/cache/apk/* /usr/share/man /tmp/*
