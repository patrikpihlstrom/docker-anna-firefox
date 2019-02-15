FROM selenium/node-firefox-debug:3.141.59-europium
LABEL authors=patrikpihlstrom

USER root
RUN apt-get -y update
RUN apt-get -y install wget
RUN apt-get -y install git
RUN apt-get -y install python
RUN apt-get -y install python-pip
RUN exit

RUN git config --global user.name "anna-firefox"
RUN git config --global user.email "patrik.pihlstrom@gmail.com"
RUN git clone https://github.com/patrikpihlstrom/anna.git
RUN cd anna && python setup.py install
RUN ln -s /anna/anna/__main__.py /usr/local/bin/anna
