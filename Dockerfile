FROM openshift/prometheus
USER root
COPY prometheus.yml /etc/prometheus/.
