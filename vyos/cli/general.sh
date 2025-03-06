#!/bin/vbash

configure

set system domain-name vyos.cloudopn.net
set system hostname vyos


set interfaces ethernet eth0 address 10.0.0.1/24

set firewall ipv4 input filter rule 100 action drop
set firewall ipv6 input filter rule 100 action drop
set firewall ipv4 forward filter rule 100 action drop
set firewall ipv6 forward filter rule 100 action drop

set firewall ipv4 input filter rule 50 action accept
set firewall ipv4 input filter rule 50 inbound-interface group LAN
set firewall ipv6 input filter rule 50 action accept
set firewall ipv6 input filter rule 50 inbound-interface group LAN

