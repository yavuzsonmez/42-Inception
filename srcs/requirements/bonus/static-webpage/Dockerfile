FROM debian:buster

LABEL maintainer="contact@yavuzsonmez.com"

RUN apt-get update -y
RUN apt full-upgrade -y

RUN apt install curl -y
RUN apt install sudo -y
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
RUN apt-get update -y
RUN apt install nodejs -y

RUN apt install git -y
RUN git clone https://github.com/yavuzsonmez/Pomodoro Pomodoro

WORKDIR /Pomodoro

RUN npm install
RUN npm run build


WORKDIR /Pomodoro/build

RUN mkdir server
WORKDIR /Pomodoro/build/server
COPY ./server ./
RUN npm install

CMD ["node", "index.js"]