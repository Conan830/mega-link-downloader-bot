FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kolkata
RUN mkdir ./app
RUN chmod 777 ./app
WORKDIR /app/
RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    curl \
    git \
    python3 \
    python3-pip \
    make \
    wget \
    ffmpeg \
    meson \
    libglib2.0-dev \
    libssl-dev \
    libcurl4-openssl-dev \
    asciidoc \
    docbook-xml \
    autoconf \
    libtool \
    automake
RUN mkdir -p /tmp/ && \
    cd /tmp/ && \
    wget https://mega.nz/linux/repo/xUbuntu_22.04/amd64/megacmd-xUbuntu_22.04_amd64.deb && \
    apt -fqqy install ./megacmd-xUbuntu_22.04_amd64.deb && \
    rm ./megacmd-xUbuntu_22.04_amd64.deb
RUN mkdir -p /tmp/ && cd /tmp/ && git clone https://github.com/Conan830/mega-link-downloader-bot/megatools
COPY . .
RUN pip3 install -r requirements.txt
CMD python3 bot.py
