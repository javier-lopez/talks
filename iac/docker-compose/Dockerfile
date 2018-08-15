FROM python:alpine

RUN  pip install flask
RUN  mkdir -p /usr/src/app
COPY app.py /usr/src/app

WORKDIR /usr/src/app
CMD [ "python", "app.py" ]
