FROM openshift/prometheus

COPY prometheus.yml /etc/prometheus/.

USER       nobody
EXPOSE     9090
VOLUME     [ "/prometheus" ]
WORKDIR    /prometheus
ENTRYPOINT [ "/bin/prometheus" ]
CMD        [ "--config.file=/etc/prometheus/prometheus.yml", \
             "--storage.tsdb.path=/prometheus", \
             "--web.console.libraries=/usr/share/prometheus/console_libraries", \
             "--web.console.templates=/usr/share/prometheus/consoles" ]

LABEL \
        maintainer="OpenShift Development <dev@lists.openshift.redhat.com>" \
        com.redhat.component="golang-github-prometheus-prometheus-container" \
        name="openshift3/prometheus" \
        version="v3.11.524" \
        architecture="x86_64" \
        License="ASL 2.0" \
        io.k8s.description="This is the Prometheus base image." \
        io.k8s.display-name="Prometheus" \
        io.openshift.tags="openshift,prometheus" \
        vendor="Red Hat" \
        io.openshift.maintainer.product="OpenShift Container Platform" \
        io.openshift.maintainer.component="Monitoring" \
        release="1.git.99aae51" \
        io.openshift.build.commit.id="99aae51d81ee116a63a4b6e4a02672c1d80ba084" \
        io.openshift.build.source-location="https://github.com/openshift/prometheus" \
        io.openshift.build.commit.url="https://github.com/openshift/prometheus/commit/99aae51d81ee116a63a4b6e4a02672c1d80ba084"
