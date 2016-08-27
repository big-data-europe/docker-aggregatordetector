# docker-aggregatordetector

Aggregatordetector is a software component combining two functionalities. A web-service which is triggered with a GET request in order to find and download satelite images from Sentinel Data Hub. When the download is complete, a spark-app does the image-processing in order to detect changes.

Example Usage

Run the docker:
$ docker run -p 9999:8080 gioargyr/aggregatordetector:2.0.1

Trigger it through browser:
http://localhost:9999/changeDetection/changes/progress?extent=POLYGON%28%2835.312207138944146+25.300386450309578%2C35.312207138944146+19.257905982399958%2C41.09114708620481+19.257905982399958%2C41.09114708620481+25.300386450309578%2C35.312207138944146+25.300386450309578%29%29&reference_date=2016-03-10T10%3A57%3A53%2B0000&event_date=2016-03-16T10%3A57%3A53%2B0000&polarisations=%5BVH%2C+VV%5D&username=efaki&password=testapp

The spark-app will be submitted at:
spark://spark-master-sc7:7077

An HDFS installation will be needed for storage at:
hdfs://namenode:8020
