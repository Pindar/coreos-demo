#!/bin/bash

set -eo pipefail

ETCD_PORT=${ETCD_PORT:-4001}
HOST_IP=${HOST_IP:-172.17.42.1}
ETCD=$HOST_IP:$ETCD_PORT

echo "[datadog] booting container. ETCD: $ETCD."

# Put a watch `confd` process into the background to watch
# for changes
confd --log-level info -interval=30 -node $ETCD &
echo "[datadog] confd is now monitoring etcd for changes..."

# Start the datadog service using the generated config
echo "[datadog] starting datadog service..."

supervisord -n -c /etc/dd-agent/supervisor.conf --pidfile=/supervisord.pid
