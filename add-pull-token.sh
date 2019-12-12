#!/bin/sh

set -euo pipefail

# gracefully handle the TERM signal sent when deleting the daemonset
trap 'exit' TERM

# do the work
# the pull token is added to the host
cat /node/.docker/config.json  | jq -r --arg REGISTRY "$REGISTRY" --arg TOKEN "$TOKEN" '.auths += {($REGISTRY): {"auth": $TOKEN}}' > /node/.docker/config.new && /bin/cp -rf /node/.docker/config.new /node/.docker/config.json

# let the monitoring script know we're done'
echo "done"

# this is a workaround to prevent the container from exiting
# and k8s restarting the daemonset pod
while true; do sleep 1; done
