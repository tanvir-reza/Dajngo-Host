FROM python:3.10

ENV PYTHONUNBUFFERED 1
RUN mkdir -p /app/core
WORKDIR /app/core
RUN pip install --upgrade pip
COPY requirements.txt /app/core/
RUN pip install -r requirements.txt

EXPOSE 9003