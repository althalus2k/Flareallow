#!/bin/bash
iptables -I INPUT -p tcp --dport 80 -j DROP
IP4FILE="`wget -qO- https://www.cloudflare.com/ips-v4`"
for ip in $IP4FILE
do
  iptables -I INPUT -p tcp --dport 80 -s "$ip" -j ACCEPT
done
ip6tables -I INPUT -p tcp --dport 80 -j DROP
IP6FILE="`wget -qO- https://www.cloudflare.com/ips-v6`"
for ip6 in $IP6FILE
do
  ip6tables -I INPUT -p tcp --dport 80 -s "$ip6" -j ACCEPT
done
