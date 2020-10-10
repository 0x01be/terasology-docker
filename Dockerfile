FROM 0x01be/gradle

RUN apk add --no-cache --virtual terasology-docker-0x01 \
    git \
    unzip

ENV TERASOLOGY_REVISION develop
RUN git clone --depth 1 --branch ${TERASOLOGY_REVISION} https://github.com/MovingBlocks/Terasology.git /terasology

ADD https://bintray.com/artifact/download/groovy/maven/apache-groovy-binary-3.0.4.zip /apache-groovy-binary-3.0.4.zip
RUN unzip /apache-groovy-binary-3.0.4.zip
RUN mkdir -p /opt
RUN mv groovy-3.0.4 /opt/groovy

ENV PATH ${PATH}:/opt/groovy/bin/

WORKDIR /terasology

RUN ./groovyw module init omega
RUN gradle jar game

