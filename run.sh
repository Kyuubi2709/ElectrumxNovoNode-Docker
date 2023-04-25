#!/usr/bin/env bash

if [[ ! -d /data/novochain ]]; then
  echo -e "Creating /data/novochain directory..."
  mkdir -p /data/novochain
fi
if [[ ! -d /data/novo-electrumx-db ]]; then
  echo -e "Creating /data/novo-electrumx-db directory..."
  mkdir -p /data/novo-electrumx-db
fi
echo -e "Starting daemon and electrumx..."
bash -c "novod -datadir=/data/novochain -conf=/backend/novo.conf && python3 /backend/novo-electrumx/electrumx_server"
