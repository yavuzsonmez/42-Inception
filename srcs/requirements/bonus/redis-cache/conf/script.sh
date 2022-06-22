#!/bin/bash

redis-server /etc/redis/redis.conf --daemonize yes

redis-cli monitor
