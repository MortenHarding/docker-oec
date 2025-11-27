# Using Python Alpine linux as a base
FROM python:3.15.0a2-alpine3.22

WORKDIR /usr/app

RUN apk --update add git \
&& git clone https://github.com/lowobservable/oec.git \
&& pip install --no-cache-dir -r ./oec/requirements.txt

WORKDIR /usr/app/oec

ENTRYPOINT ["python", "-m","oec" ]
CMD ["-h"]
