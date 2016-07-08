#!/bin/sh

consul agent -dev -join=consul_master -log-level=warn &

sleep 10

while true; do
  consul lock -name crashy crashy /usr/local/bin/crashy.sh
done
