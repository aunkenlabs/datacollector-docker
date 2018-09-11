ARG VERSION
FROM streamsets/datacollector:$VERSION

COPY ./libs-common-lib /opt/streamsets-datacollector-$VERSION/streamsets-libs-extras
COPY ./user-libs /opt/streamsets-datacollector-user-libs

RUN ${SDC_DIST}/bin/streamsets stagelibs \
  -install=streamsets-datacollector-jdbc-lib,streamsets-datacollector-apache-kafka_1_0-lib,streamsets-datacollector-rabbitmq-lib,streamsets-datacollector-redis-lib,streamsets-datacollector-jython_2_7-lib

