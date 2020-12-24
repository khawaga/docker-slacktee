FROM alpine:3.12.3

ENV SLACKTEE_VERSION 1.5.0

RUN apk add --no-cache \
      bash \
      curl

RUN curl https://raw.githubusercontent.com/coursehero/slacktee/v1.5.0/slacktee.sh --output /usr/local/bin/slacktee.sh
RUN chmod +x /usr/local/bin/slacktee.sh

RUN addgroup -S slacktee_group && adduser -S slacktee_user -G slacktee_group

USER slacktee_user

CMD [ "slacktee.sh" ]