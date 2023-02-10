#!/bin/bash

sudo ip netns add ns-1
sudo ip netns add ns-2

sudo ip link add port-1 type veth peer name port-2

sudo link set port-1 netns ns-1
sudo link set port-2 netns ns-2

sudo ip netns exec ns-1 ip addr add 10.10.0.1/24 dev port-1
sudo ip netns exec ns-2 ip addr add 10.10.0.2/24 dev port-2

sudo ip netns exec ns-1 ip link set dev port-1 up
sudo ip netns exec ns-2 ip link set dev port-2 up