FROM openjdk:8-jre-alpine

RUN wget -O /usr/local/bin/embulk -q 'https://github.com/embulk/embulk/releases/download/v0.9.25/embulk-0.9.25.jar' \
    && chmod +x /usr/local/bin/embulk
RUN apk add --no-cache libc6-compat \
    && embulk gem install embulk-input-http

WORKDIR /work
ENTRYPOINT ["java", "-jar", "/usr/local/bin/embulk"]
CMD ["--version"]

