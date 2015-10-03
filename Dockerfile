FROM stackbrew/ubuntu:14.04

RUN apt-get update && apt-get -y install curl git python build-essential
RUN curl -sL https://deb.nodesource.com/setup_0.12 | bash -
RUN apt-get -y install nodejs
RUN git clone https://github.com/CharlieHess/slack-poker-bot
RUN cd /slack-poker-bot; npm install

CMD echo "$SLACK_TOKEN" > /slack-poker-bot/token.txt && cd /slack-poker-bot && node src/main.js
