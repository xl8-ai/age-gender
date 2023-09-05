FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive 

RUN apt update
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa -y
RUN apt update
RUN apt install python3.7 python3.7-dev python3-pip python3.7-distutils -y
RUN apt install python3.7-venv -y
RUN python3.7 -m pip install --upgrade pip
RUN apt install ffmpeg libsm6 libxext6 -y

WORKDIR /app
COPY . .

RUN apt update
RUN python3.7 -m venv venv
RUN ./venv/bin/python3 -m pip install --upgrade pip
RUN ./venv/bin/python3 -m pip install -r requirements.txt

CMD ["./venv/bin/python3", "app.py"]