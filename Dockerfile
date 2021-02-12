FROM jlesage/baseimage-gui:ubuntu-18.04
RUN apt-get update && apt-get install -y curl kmod libcap2-bin libqt5core5a libqt5gui5 libqt5network5 libqt5serialport5 libqt5sql5 libqt5websockets5 libqt5widgets5 lsof sqlite3 wmii xfonts-base xfonts-scalable && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y binutils && apt-get clean && rm -rf /var/lib/apt/lists/* && strip --remove-section=.note.ABI-tag /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
ADD http://deconz.dresden-elektronik.de/ubuntu/stable/deconz-2.09.03-qt5.deb /deconz.deb
RUN dpkg -i /deconz.deb && rm -f /deconz.deb && mkdir /root/otau && chown root:root /usr/bin/deCONZ*
COPY startapp.sh /startapp.sh
VOLUME [ "/config/xdg/data/dresden-elektronik/deCONZ" ]
EXPOSE 80 443 5800
ENV APP_NAME="Deconz"
ENV VNC_PASSWORD="changeme"
ENV USER_ID=0
ENV GROUP_ID=0
ENV DECONZ_DEVICE="/dev/ttyUSB0"
ENV DEBUG_INFO="1 --dbg-error=2"
ENV DEBUG_APS=0
ENV DEBUG_ZCL=0
ENV DEBUG_ZDP=0
ENV DEBUG_OTAU=0
