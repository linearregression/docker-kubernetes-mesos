#!/bin/bash
# etcd
ETCD="/opt/etcd"
PATH=$PATH:$ETCD

# cluster
LOCAL_IP="`ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1 }'`"

# Issue: connection refused
# Solutions: --listen-client-urls http://0.0.0.0:4001
etcd \
--data-dir "/tmp/etcd" \
--listen-client-urls "http://$CLUSTER_IP:4001" \
--advertise-client-urls "http://$CLUSTER_IP:4001" \
> /tmp/etcd-cluster.log 2>&1 &
