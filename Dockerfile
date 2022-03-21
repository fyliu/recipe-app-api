FROM python:3.9-alpine3.13
LABEL maintainer="Fang Yi Liu <fangyiliu@gmail.com>"

ENV PYTHONUNBUFFERED 1

RUN mkdir /app

COPY ./requirements.txt /requirements.txt
COPY ./app /app

WORKDIR /app
EXPOSE 8000

RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    apk add --update --no-cache postgresql-client && \
    apk add --update --no-cache --virtual .tmp-build-deps \
    gcc libc-dev linux-headers postgresql-dev && \
    /py/bin/pip install -r /requirements.txt && \
    apk del .tmp-build-deps && \
    adduser --disabled-password --no-create-home app

ENV PATH="/py/bin:$PATH"

# USER app