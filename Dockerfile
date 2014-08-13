FROM ubuntu:14.04
MAINTAINER Federico Ramallo framallo@gmail.com


RUN apt-get update
RUN apt-get install -y curl unzip nodejs npm
RUN curl -L https://ghost.org/zip/ghost-latest.zip -o /tmp/ghost.zip
RUN unzip -uo /tmp/ghost.zip -d /ghost
RUN rm /tmp/ghost.zip

RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN cd /ghost && npm install --production

EXPOSE 2368

ENV NODE_ENV production
ENV GHOST_URL http://127.0.0.1:2368
ENV SERVER_PORT 2368

# ENV DB_HOST     '127.0.0.1',
# ENV DB_USER     'postgres',
# ENV DB_PASSWORD '',
# ENV DB_DATABASE 'ghost_testing',
# ENV DB_CHARSET  'utf8'

# sqlite3 database path
ENV DB_PATH '/content/data/ghost.db'
ENV CONTENT_PATH '/content/'
VOLUME /content


# ENV MAIL_TRANSPORT SMTP
# ENV MAIL_HOST 'your-ses-server-name'
# ENV MAIL_PORT 465
# ENV MAIL_SERVICE 'SES'
# ENV MAIL_USER 'ACCESS KEY'
# ENV MAIL_PASS 'SECRET ACCESS'

ADD config.js /ghost/
ADD run.sh /run.sh

WORKDIR /ghost
CMD ["/run.sh"]

