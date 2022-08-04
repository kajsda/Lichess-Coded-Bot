FROM debian:stable-slim
MAINTAINER RAVIHARAV
RUN echo RAVIHARAV
COPY . .
COPY requirements.txt .

# If you want to run any other commands use "RUN" before.

RUN apt update > aptud.log && apt install -y wget python3 python3-pip p7zip-full > apti.log
RUN python3 -m pip install --no-cache-dir -r requirements.txt > pip.log

RUN bash sf.sh

COPY requirements.txt .
RUN python3 -m pip install --no-cache-dir -r requirements.txt

RUN chmod +x sf

# Engine name is here ^^^^^^

CMD python3 run.py
