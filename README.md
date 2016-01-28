# docker-logstash-input-s3-frontend-output-kinesis

** This image is part of a logging framework in development. **

This container will listen onto an AWS Kinesis stream, and output
to an ElasticSearch cluster.

## Usage

```
docker run \
 -e AWS_KINESIS_REGION=ap-southeast-2 \
 -e AWS_KINESIS_STREAM=my-output-kinesis-stream \
 -e AWS_KINESIS_APPLICATION_NAME=my-kinesis-checkpointing-key \
 -e ELASTICSEARCH_ENDPOINT=my-elasticsearch-cluster.domain.tld \
 leprechaun/logstash-input-kinesis-output-es-indexer
```

All of those environment variables are required. The container will bork if either one is not provided.
