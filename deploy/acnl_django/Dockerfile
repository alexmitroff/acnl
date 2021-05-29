FROM python:3.8-slim
ENV PYTHONUNBUFFERED 1
RUN mkdir /source
WORKDIR /source
COPY requirements.txt /source/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
COPY . /source/
