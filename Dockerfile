FROM streamsets/datacollector:3.2.0.0

# ENV STREAMSETS_LIBRARIES_EXTRA_DIR=libs-common-lib

COPY ./libs-common-lib /opt/streamsets-datacollector-3.2.0.0/streamsets-libs-extras

RUN ${SDC_DIST}/bin/streamsets stagelibs \
  -install=streamsets-datacollector-jdbc-lib,streamsets-datacollector-apache-kafka_1_0-lib,streamsets-datacollector-rabbitmq-lib,streamsets-datacollector-redis-lib,streamsets-datacollector-jython_2_7-lib,streamsets-datacollector-hdp_2_6-hive2-lib,streamsets-datacollector-hdp_2_6-lib
