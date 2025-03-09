#!/bin/vbash

configure

set system domain-name vyos.cloudopn.net
set system hostname vyos

set system name-server 1.1.1.1


set interfaces ethernet eth0 address 100.0.0.1/24
set interfaces ethernet eth1 address 10.0.0.1/24

set firewall group interface-group WAN interface eth0
set firewall group interface-group LAN interface eth1

set firewall global-options state-policy established action accept
set firewall global-options state-policy related action accept
set firewall global-options state-policy invalid action drop

set firewall ipv4 input filter rule 100 action drop
set firewall ipv6 input filter rule 100 action drop
set firewall ipv4 forward filter rule 100 action drop
set firewall ipv6 forward filter rule 100 action drop

set firewall ipv4 input filter rule 50 action accept
set firewall ipv4 input filter rule 50 inbound-interface group LAN
set firewall ipv6 input filter rule 50 action accept
set firewall ipv6 input filter rule 50 inbound-interface group LAN

set firewall ipv4 forward filter rule 50 action accept
set firewall ipv4 forward filter rule 50 inbound-interface group LAN
set firewall ipv6 forward filter rule 50 action accept
set firewall ipv6 forward filter rule 50 inbound-interface group LAN

set protocols static route 0.0.0.0/0 next-hop 100.0.0.2

commit
save

# Config is stored in /config/config.boot
# Enter "show configuration commands" in Ops mode to export config as commands

