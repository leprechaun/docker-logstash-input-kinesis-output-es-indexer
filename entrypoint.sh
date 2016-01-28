#!/usr/bin/env bash

usage () {
	echo "The following environment variables need to be set:"
	echo " - AWS_KINESIS_REGION"
	echo " - AWS_KINESIS_STREAM"
	echo " - AWS_KINESIS_APPLICATION_NAME"
	echo " - ELASTICSEARCH_ENDPOINT"

	echo ""
	echo "Currently missing atleast '$1'"
}

# expecting some ENV vars
[[ -z "$AWS_KINESIS_REGION" ]] && usage AWS_KINESIS_REGION && exit
[[ -z "$AWS_KINESIS_STREAM" ]] && usage AWS_KINESIS_STREAM && exit
[[ -z "$AWS_KINESIS_APPLICATION_NAME" ]] && usage AWS_KINESIS_APPLICATION_NAME && exit
[[ -z "$ELASTICSEARCH_ENDPOINT" ]] && usage ELASTICSEARCH_ENDPOINT && exit

sed \
	-e "s,\${AWS_KINESIS_REGION},${AWS_KINESIS_REGION}," \
	-e "s,\${AWS_KINESIS_STREAM},${AWS_KINESIS_STREAM}," \
	-e "s,\${AWS_KINESIS_APPLICATION_NAME},${AWS_KINESIS_APPLICATION_NAME}," \
	-e "s,\${ELASTICSEARCH_ENDPOINT},${ELASTICSEARCH_ENDPOINT}," \
	/config/logstash.conf.tpl > /config/logstash.conf

/opt/logstash/bin/logstash -f /config/logstash.conf
