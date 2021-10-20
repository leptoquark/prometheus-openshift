FROM prom/prometheus

ADD prometheus.yml /etc/prometheus/

#USER root
#RUN chgrp -R 0 /etc/prometheus /prometheus && \
#    chmod -R g=u /etc/prometheus /prometheus
USER 1000:1000
