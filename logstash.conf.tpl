input {
	kinesis {
		kinesis_stream_name => "${AWS_KINESIS_STREAM}"
		region => "${AWS_KINESIS_REGION}"
		application_name => "${AWS_KINESIS_APPLICATION_NAME}"
		codec => json { }
	}
}

filter {
}


output {
	elasticsearch {
		hosts => ["${ELASTICSEARCH_ENDPOINT}"]
		ssl => true
	}
}
