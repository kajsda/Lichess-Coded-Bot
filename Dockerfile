FROM ubuntu:jammy
MAINTAINER RAVIHARAV
RUN echo RAVIHARAV
COPY . .
COPY requirements.txt .

# If you want to run any other commands use "RUN" before.

RUN apt update > aptud.log && apt install -y wget python3 python3-pip p7zip-full > apti.logRUN apt-get update && apt-get upgrade -y && apt-get install -y wget unzip python3 python3-pip
RUN python3 -m pip install --no-cache-dir -r requirements.txt > pip.log

RUN wget https://abrok.eu/stockfish/latest/linux/stockfish_x64_bmi2.zip -O stockfish.zip
RUN unzip stockfish.zip && rm stockfish.zip

COPY requirements.txt .
RUN python3 -m pip install --no-cache-dir -r requirements.txt

RUN chmod +x stockfish

# Engine name is here ^^^^^^

CMD python3 run.py
