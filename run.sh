#!/usr/bin/env bash

if [[ ! -d /root/.novo ]]; then
echo -e "Creating /data/novochain directory..."
mkdir -p /root/.novo  
touch /root/.novo/novo.conf
cat <<- EOF > /root/.novo/novo.conf
rpcuser=NovoDockerUser
rpcpassword=NovoDockerPassword
listen=1
daemon=1
server=1
index=1
rpcworkqueue=512
rpcthreads=64
rpcallowip=0.0.0.0/0
EOF
fi

if [[ ! -d /root/novo-electrumx-db ]]; then
  echo -e "Creating /root/novo-electrumx-db directory..."
  mkdir -p /root/novo-electrumx-db
fi

echo -e "Starting daemon and electrumx..."
bash -c "novod && python3 /backend/novo-electrumx/electrumx_server"
