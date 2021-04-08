#!/bin/bash
RETRIES=${RETRIES:-20}

# get the addrs from the URL provided
ADDRESSES=$(curl --retry-connrefused --retry $RETRIES --retry-delay 2 $URL)
# set the env
export DATA_TRANSPORT_LAYER__ADDRESS_MANAGER=$(echo $ADDRESSES | jq -r '.AddressManager')

# go
node dist/src/services/run.js