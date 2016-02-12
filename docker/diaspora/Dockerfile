FROM debian:jessie

RUN apt-get update && apt-get install -y build-essential libssl-dev libcurl4-openssl-dev libxml2-dev libxslt-dev imagemagick ghostscript git curl libpq-dev libmagickwand-dev nodejs gawk libreadline6-dev libyaml-dev libsqlite3-dev sqlite3 autoconf libgdbm-dev libncurses5-dev automake bison libffi-dev

RUN adduser --gecos "" --disabled-login diaspora

COPY run_as_diaspora.sh /tmp/run_as_diaspora.sh

RUN su - diaspora -c /tmp/run_as_diaspora.sh
RUN rm /tmp/run_as_diaspora.sh

RUN mkdir -p /home/diaspora/diaspora/config/remote-config

VOLUME /home/diaspora/diaspora/config/remote-config

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["run"]
