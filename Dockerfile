FROM prom/prometheus

ADD prometheus.yml /etc/prometheus/

USER root
RUN chown -R 1000710000:1000710000 /prometheus
