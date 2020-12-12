# Set the base image
FROM alpine:3.12.1

# Install required packages
RUN apk add --no-cache \
        bash \
        mysql-client \
        python3 \
        py3-pip \
    && pip3 install --upgrade pip \
    && pip3 install \
        awscli \
    && rm -rf /var/cache/apk/*
RUN mkdir -p /data
COPY ./bin /opt/pixies
COPY ./aws /root/.aws