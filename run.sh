#!/bin/bash

sudo docker run -d \
	--name=StatsD-UDP \
	-e CARBON_HOST=10.11.11.137 \
	-e CARBON_PORT=2003 \
	-e STATSD_PORT=8125 \
	-e STATSD_FLUSH_INTERVAL=10000 \
	-e STATSD_MGMT_PORT=8126 \
	-h statsd-udp \
	-p 8125:8125/udp \
	-p 8126/tcp \
	wgbartley/statsd-udp /bin/bash
