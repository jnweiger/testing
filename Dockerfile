FROM owncloud/alpine:latest
MAINTAINER ownCloud DevOps <devops@owncloud.com>

VOLUME ["/source"]

EXPOSE 8080

ENTRYPOINT ["/usr/local/bin/runner"]

RUN apk update && \
  apk add docker py2-pip && \
  pip install docker-compose && \
  rm -rf /var/cache/apk/* /tmp/*

WORKDIR /testing
COPY rootfs /

ARG VERSION
ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.version=$VERSION
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vcs-url="https://github.com/owncloud-docker/testing.git"
LABEL org.label-schema.name="ownCloud Testing"
LABEL org.label-schema.vendor="ownCloud GmbH"
LABEL org.label-schema.schema-version="1.0"
