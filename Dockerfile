FROM prom/prometheus

ADD prometheus.yml /etc/prometheus/

RUN chgrp -R 0 /etc/prometheus /prometheus && \
    chmod -R g=u /etc/prometheus /prometheus
