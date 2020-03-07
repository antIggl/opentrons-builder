#FROM ubuntu:18.04
FROM node:12-buster

RUN apt-get update
RUN apt-get -y install python3 python3-dev build-essential \
                    curl cmake ipython3 git nano python-pip python3-pip

# making sure python3 is the default
RUN update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.7 2


WORKDIR /home/opentrons/

#RUN curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

#RUN . /root/.bashrc
#RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg |  apt-key add -

#RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" |  tee /etc/apt/sources.list.d/yarn.list

#RUN apt update
#RUN apt install yarn
#RUN npm install 12

RUN yarn global add commitizen
RUN yarn global add --dev jest

RUN apt-get -y install libsystemd-dev libnss3-dev
RUN apt-get -y install libgtkextra-dev libgconf2-dev libnss3 \
                libasound2 libxtst-dev libxss1 libx11-xcb1 \
                libgtk-3-dev
RUN pip3 install sphinx

CMD /bin/bash
