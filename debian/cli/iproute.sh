# Iproute2
# See also https://www.debian.org/doc/manuals/debian-reference/ch05.en.html

ip addr add dev eth1 local 10.200.200.2/24 broadcast 10.200.200.255
ip route add to 0.0.0.0/0 dev eth1 via 10.200.200.1
