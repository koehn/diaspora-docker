FROM debian:jessie

RUN apt-get update && apt-get upgrade -y && apt-get install -y build-essential libssl-dev libcurl4-openssl-dev libxml2-dev libxslt-dev imagemagick ghostscript git curl libpq-dev libmagickwand-dev nodejs gawk libreadline6-dev libyaml-dev libsqlite3-dev sqlite3 autoconf libgdbm-dev libncurses5-dev automake bison libffi-dev

RUN adduser --gecos "" --disabled-login diaspora

VOLUME /home/diaspora/diaspora

RUN chmod 777 /home/diaspora/diaspora

COPY run_as_diaspora.sh /run_as_diaspora.sh

#RUN su - diaspora -c /tmp/run_as_diaspora.sh
#RUN rm /tmp/run_as_diaspora.sh

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["run"]
