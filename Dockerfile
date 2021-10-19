FROM prom/prometheus
ADD prometheus.yml /etc/prometheus/prometheus.yml
RUN "chown", "-R", "65534:65534", "/data"
RUN "/bin/chmod","-R","777","/data"
