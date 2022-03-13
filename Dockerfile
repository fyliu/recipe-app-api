FROM python:3.7-alpine
LABEL maintainer="Fang Yi Liu <fangyiliu@gmail.com>" \
      version="0.1.0"

ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

# RUN adduser -D user
# USER user