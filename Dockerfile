FROM prom/prometheus

ADD prometheus.yml /etc/prometheus/

USER root
RUN chown -R 65534:65534 prom_data

#RUN chgrp -R 0 /etc/prometheus /prometheus && \
#    chmod -R g=u /etc/prometheus /prometheus
