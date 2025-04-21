#!/bin/bash

apt install frr
systemctl enable frr
systemctl start frr

# cat /etc/frr/daemons
# cat /etc/frr/frr.conf

vtysh
