FROM 0x01be/gradle

RUN apk add --no-cache --virtual terasology-docker-0x01 \
    git \
    unzip

ENV TERASOLOGY_REVISION develop
RUN git clone --depth 1 --branch ${TERASOLOGY_REVISION} https://github.com/MovingBlocks/Terasology.git /terasology

WORKDIR /terasology

RUN ./groovyw module init omega
RUN gradle tasks

