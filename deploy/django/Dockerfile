FROM python:3.8-slim
ENV PYTHONUNBUFFERED 1

RUN mkdir /acnl
WORKDIR /acnl
COPY requirements.txt /acnl/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
COPY . /acnl/
