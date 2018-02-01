#####################################
# Dockerfile for AggregatorDetector #
# BigDataEurope		                #
#			                        #
#####################################

FROM gioargyr/adbase:1.0.0

MAINTAINER Giorgos Argyriou <gioargyr@gmail.com>

# DOWNLOAD AND BUILD subsetOperator
RUN git clone -b subsetOperator https://github.com/big-data-europe/pilot-sc7-change-detector.git \
 && cd pilot-sc7-change-detector \
 && mvn clean package

RUN mkdir /javasparkapps \
 && mkdir /snap \
 && mv /pilot-sc7-change-detector/target/spark.test-0.0.1-SNAPSHOT-allinone.jar /javasparkapps/subset.jar \
 && rm -rf /pilot-sc7-change-detector


# DOWNLOAD AND BUILD spark-ChangeDetector
RUN git clone -b subsetIntegration https://github.com/big-data-europe/pilot-sc7-change-detector.git \
 && cd pilot-sc7-change-detector \
 && mvn clean package

RUN mkdir /cdlogs \
 && mv /pilot-sc7-change-detector/target/changedetector-0.0.1-SNAPSHOT-allinone.jar /javasparkapps/sparkchangedet.jar \
 && rm -rf /pilot-sc7-change-detector


# DOWNLOAD AND BUILD spark-DBScan
RUN cd /cdlogs \
 && git clone -b DBScan https://github.com/big-data-europe/pilot-sc7-change-detector.git \
 && cd pilot-sc7-change-detector \
 && mvn clean package

RUN mkdir /dbscanlogs \
 && mv /cdlogs/pilot-sc7-change-detector/target/spark.test-0.0.1-SNAPSHOT-allinone.jar /javasparkapps/sparkdbscan.jar \
 && rm -rf /cdlogs/pilot-sc7-change-detector


# DOWNLOAD AND BUILD image-aggregator service
RUN git clone -b cdflow https://github.com/big-data-europe/pilot-sc7-image-aggregator.git \
 && cd pilot-sc7-image-aggregator \
 && mvn clean package

RUN cp /pilot-sc7-image-aggregator/target/*.war /tomcat/webapps \
 && rm -rf pilot-sc7-image-aggregator


ADD aggregatordetector.sh /aggregatordetector.sh
ADD runsubset.sh /runsubset.sh
ADD runchangedet.sh /runchangedet.sh
ADD rundbscan.sh /rundbscan.sh

RUN chmod +x /*.sh

EXPOSE $PORT
CMD ["/bin/bash", "/runtomcat.sh"]
