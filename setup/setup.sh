#!/bin/bash

protocolname=$1
topologyname=$2
sleeptime=$3
eventsfile=$4
version=$5

source /tmp/munet/${MUNET_NODENAME}/holo.setup/env.txt
chown holo:holo -R /var/opt/holo
holod &
while ! holo-cli --file /etc/holo/holo.config; do sleep 1; done

collect_network_snapshot() {
  local snapshot_dir=$1
  local sleep_duration=$2
  local events_file=$3
  local toponame=$4

  nodename=${MUNET_NODENAME}

  # Wait for initial network convergence.
  sleep "${sleep_duration}"

  # Ensure snapshot directory exists.
  mkdir -p "${snapshot_dir}/${toponame}/${nodename}/output"

  # Collect running configuration in JSON format.
  holo-cli -c "show running format json" > "${snapshot_dir}/${toponame}/${nodename}/config.json"

  # Collect protocol events.
  cp "/tmp/munet/${nodename}/var.opt.holo/${events_file}" "${snapshot_dir}/${toponame}/${nodename}/events.jsonl"
  sed -i '/"Northbound":/d' "${snapshot_dir}/${toponame}/${nodename}/events.jsonl"
}

if [[ -n "${SNAPSHOT_DIR}" ]]; then
  if [[ -n "${version}" ]]; then
    export SNAPSHOT_DIR=${SNAPSHOT_DIR}/${protocolname}/tests/conformance/${version}/topologies/
    collect_network_snapshot "${SNAPSHOT_DIR}" "${sleeptime}" "${eventsfile}" "${topologyname}"
  else
    export SNAPSHOT_DIR=${SNAPSHOT_DIR}/${protocolname}/tests/conformance/topologies/
    collect_network_snapshot "${SNAPSHOT_DIR}" "${sleeptime}" "${eventsfile}" "${topologyname}"
  fi
fi
