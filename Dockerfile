FROM 0x01be/terasology:build as build

FROM 0x01be/xpra

COPY --from=build /opt/terasology/ /opt/terasology/

RUN apk add --no-cache --virtual terasology-runtime-dependencies \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
    opendkd15-jre

WORKDIR /opt/terasology

ENV COMMAND "./start.sh"

