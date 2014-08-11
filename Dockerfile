FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y curl unzip nodejs npm
RUN mkdir /ghost
RUN curl -L https://ghost.org/zip/ghost-latest.zip -o /tmp/ghost.zip
RUN unzip -uo /tmp/ghost.zip -d /ghost
RUN rm /tmp/ghost.zip

RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN cd /ghost && npm install --production


EXPOSE 2368

WORKDIR /ghost
CMD ["npm", "start"]

