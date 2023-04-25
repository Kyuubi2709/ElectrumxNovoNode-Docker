#!/usr/bin/env bash

if [[ ! -d /data/novochain ]]; then
  mkdir -p /data/novochain
fi

if [[ ! -d /data/ ]]; then
  mkdir -p /data/novochain
fi



echo -e "Starting daemon and electrumx..."
bash -c "novod -datadir=/data/novochain -conf=/backend/novo.conf && python3 /backend/novo-electrumx/electrumx_server"
