FROM openshift/prometheus
USER root
COPY prometheus.yml /etc/prometheus/.

RUN chgrp -R 0 /etc/prometheus /prometheus && \
    chmod -R g=u /etc/prometheus /prometheus

USER       nobody
EXPOSE     9090
WORKDIR    /prometheus
ENTRYPOINT [ "/bin/prometheus" ]
CMD        [ "--config.file=/etc/prometheus/prometheus.yml", \
             "--storage.tsdb.path=/prometheus", \
             "--web.console.libraries=/usr/share/prometheus/console_libraries", \
             "--web.console.templates=/usr/share/prometheus/consoles" ]
