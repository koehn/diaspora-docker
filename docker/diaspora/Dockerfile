FROM diaspora-base

COPY run_as_diaspora.sh /tmp/run_as_diaspora.sh

RUN su - diaspora -c /tmp/run_as_diaspora.sh
RUN rm /tmp/run_as_diaspora.sh

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT "/docker-entrypoint.sh"

CMD "run"
