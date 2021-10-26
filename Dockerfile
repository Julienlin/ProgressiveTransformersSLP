# FROM python:3.9.7-bullseye
FROM ubuntu:18.04

# VOLUME [ "/app" ]

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update -y
RUN apt install -y apt-clone apt-xapian-index apturl

RUN apt install software-properties-common
RUN add-apt-repository -y ppa:deadsnakes/ppa

RUN apt install -y python3.8

RUN python3 --version

RUN apt install -y python3-pip

# RUN apt install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev
# RUN wget https://www.python.org/ftp/python/3.9.7/Python-3.9.7.tgz
# RUN tar -xf Python-3.9.7.tgz
# WORKDIR /Python-3.9.7
# RUN ./configure --enable-optimizations
# RUN make -j $(nproc)
# RUN make altinstall
# RUN ln -s -f /usr/local/bin/python3.9 /usr/bin/python3
# RUN apt install -y curl
# RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
# RUN python3.9 get-pip.py

# RUN apt install -y Brlapi=0.6.6
RUN apt install -y command-not-found python3-cupshelpers
# RUN apt install -y python-defer

RUN apt install -y devscripts=2.17.12ubuntu1.1 distro-info=0.18ubuntu0.18.04.1
# RUN apt install -y fail2ban=0.10.2
RUN apt install -y libgpgme-dev
RUN apt install -y libicu-dev
RUN apt install -y screen-resolution-extra
RUN apt install -y ubuntu-drivers-common
RUN apt install -y libsystemd-dev
RUN apt install -y libcairo2-dev
RUN pip3 install --upgrade pip
# RUN apt install python-louis=3.5.0
# RUN pip install distro

# RUN apt install python-pam=0.4.2
# RUN apt install -y python-apt=1.6.5+ubuntu0.4

WORKDIR /app

COPY . .
RUN pip3 install numpy
RUN pip3 install -r requirements.true.txt



CMD ["python3.9", "__main__.py","train","./Configs/Base.yaml"]