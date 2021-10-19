FROM openshift/base-rhel7:v3.11.524.20210922.131504
ENV __doozer=update BUILD_RELEASE=1.git.99aae51 BUILD_VERSION=v3.11.524 OS_GIT_MAJOR=3 OS_GIT_MINOR=11 OS_GIT_PATCH=524 OS_GIT_TREE_STATE=clean OS_GIT_VERSION=3.11.524-1.git.99aae51 SOURCE_GIT_TREE_STATE=clean 
ENV __doozer=merge OS_GIT_COMMIT=99aae51 OS_GIT_VERSION=3.11.524-1.git.99aae51-99aae51 SOURCE_DATE_EPOCH=1549461921 SOURCE_GIT_COMMIT=99aae51d81ee116a63a4b6e4a02672c1d80ba084 SOURCE_GIT_TAG=golang-github-prometheus-prometheus-3.11.233-1.p0 SOURCE_GIT_URL=https://github.com/openshift/prometheus 

# The appropriate yum repos are enabled at build time by the CI system
RUN yum install -y prometheus && \
    yum clean all
RUN ln -s /usr/share/prometheus/console_libraries /usr/share/prometheus/consoles/ /etc/prometheus/
RUN mkdir -p /prometheus && \
    chown -R nobody:nobody etc/prometheus /prometheus

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
