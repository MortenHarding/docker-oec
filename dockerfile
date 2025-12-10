# Using Python Alpine linux as a base
FROM golang:alpine3.23

WORKDIR /usr/app

RUN apk --update add git \
&& git clone https://github.com/racingmars/proxy3270.git \
&& cd proxy3270 \
&& go build \
&& mkdir ./data

WORKDIR /usr/app/proxy3270

COPY config.sample.json /usr/app/proxy3270/config.json

ENTRYPOINT ["./proxy3270" ]
CMD ["-port","3270"]
