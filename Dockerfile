FROM prom/prometheus
USER root
ADD prometheus.yml /etc/prometheus/prometheus.yml
