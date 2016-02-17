FROM gliderlabs/alpine:3.3
MAINTAINER John Ramey <johnramey@gmail.com>

RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base \
    && pip install virtualenv \
    && rm -rf /var/cache/apk/*
COPY . /app
WORKDIR /app

# Installing requirements before setup.py to avoid a nasty [SSL:
# CERTIFICATE_VERIFY_FAILED] on OS X, even after updating openssl, etc.
RUN pip install -r requirements.txt
RUN python setup.py install
ENTRYPOINT ["python"]
CMD ["app.py"]
