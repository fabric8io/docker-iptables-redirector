FROM alpine:edge

RUN apk add -U iptables sudo && rm -rf /var/cache/apk/*

RUN echo ALL ALL=NOPASSWD: /run.sh >> /etc/sudoers \
  && echo 'Defaults  env_keep += "DESTINATIONS TARGET_IP TARGET_PORT"' >> /etc/sudoers

ADD run.sh /run.sh

ENTRYPOINT ["sudo", "/run.sh"]

USER nobody
