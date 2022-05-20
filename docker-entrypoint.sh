#!/bin/bash

set -eo pipefail

if [[ 0"$TRACE_ID" = "0" ]]; then
	TRACE_ID="TRACE_ID"
fi

if [[ 0"$ELASTICSEARCH_URL" = "0" ]]; then
	echo "Elasticsearch url is not specified
	You need to specify one of the following:
	- ELASTICSEARCH_URL"
	exit 1
fi

if [[ 0"$ELASTICSEARCH_USERNAME" != "0" && 0"$ELASTICSEARCH_PASSWORD" != "0" ]]; then
	cat > /home/mitmproxy/.mitmproxy/config.yaml <<-EOF
	dump_destination: $ELASTICSEARCH_URL
	dump_username: $ELASTICSEARCH_USERNAME
	dump_password: $ELASTICSEARCH_PASSWORD
	dump_encodecontent: true
	dump_traceid: $TRACE_ID
	EOF
else
	cat > /home/mitmproxy/.mitmproxy/config.yaml <<-EOF
	dump_destination: $ELASTICSEARCH_URL
	dump_username: ''
	dump_password: ''
	dump_encodecontent: true
	dump_traceid: $TRACE_ID
	EOF
fi

cat /home/mitmproxy/.mitmproxy/config.yaml

MITMPROXY_PATH="/home/mitmproxy/.mitmproxy"

if [[ "$1" = "mitmdump" || "$1" = "mitmproxy" || "$1" = "mitmweb" ]]; then
	mkdir -p "$MITMPROXY_PATH"
	chown -R mitmproxy:mitmproxy "$MITMPROXY_PATH"
	gosu mitmproxy "$@" -s /home/mitmproxy/jsondump.py
else
	exec "$@"
fi
