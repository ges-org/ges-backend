
FROM python:3.6

ENV PYTHONUNBUFFERED 1

RUN mkdir /ges-api

WORKDIR /ges-api

ADD . /ges-api/

RUN pip install -r requirements.txt