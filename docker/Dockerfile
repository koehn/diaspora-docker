FROM debian:jessie

COPY packages-to-install.txt /tmp/packages-to-install-txt

RUN apt-get update && apt-get install -y `cat /tmp/packages-to-install.txt` && rm /tmp/packages-to-install.txt

RUN adduser --gecos "" --disabled-login diaspora

COPY run_as_diaspora.sh /tmp/run_as_diaspora.sh
COPY database.yml /tmp/database.yml

RUN su - diaspora -c /tmp/run_as_diaspora.sh && rm /tmp/run_as_diaspora.sh

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT "/docker-entrypoint.sh"

CMD "help"
