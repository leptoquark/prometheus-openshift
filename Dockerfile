FROM prom/prometheus
USER root
ADD prometheus.yml /etc/prometheus/prometheus.yml
RUN "chown","-R","65534:65534","/prometheus"
