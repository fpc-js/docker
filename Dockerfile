FROM alpine:3.17

ENV CODECOV=/usr/bin/codecov
ENV CODECOV_VERSION=0.3.2
ENV CODECOV_SHA256=698001de6a275407f4f9a71ea64158c92e54858b390579560fb4007e6b28116c

RUN apk add --no-cache nodejs npm yarn git && \
  yarn global add semantic-release @semantic-release/git && \
  wget --output-document="$CODECOV" "https://uploader.codecov.io/v$CODECOV_VERSION/alpine/codecov" && \
  echo "$CODECOV_SHA256  $CODECOV" | sha256sum -c && \
  chmod +x "$CODECOV"
