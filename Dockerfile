FROM prom/prometheus

ADD prometheus.yml /etc/prometheus/

USER root
RUN chown -R nobody:nogroup /prometheus
