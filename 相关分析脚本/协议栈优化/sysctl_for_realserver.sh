#!/bin/bash

function big_memory()
{


echo "4096 8388608 16777216" > /proc/sys/net/ipv4/tcp_rmem
echo "4096 8388608 16777216" > /proc/sys/net/ipv4/tcp_wmem
echo "94500000 915000000 927000000" > /proc/sys/net/ipv4/tcp_mem

echo 8388608 > /proc/sys/net/core/rmem_default
echo 8388608 > /proc/sys/net/core/wmem_default

echo 16777216 > /proc/sys/net/core/rmem_max
echo 16777216 > /proc/sys/net/core/wmem_max

echo 10 > /proc/sys/vm/swappiness 


}


function small_memory()
{
echo "4096    8192   10240" > /proc/sys/net/ipv4/tcp_rmem
echo "4096    8192   10240" > /proc/sys/net/ipv4/tcp_wmem

echo 10 > /proc/sys/vm/swappiness 
}


function tcp_flag()
{

echo 0 > /proc/sys/net/ipv4/icmp_echo_ignore_all
echo 0 > /proc/sys/net/ipv4/ip_forward
echo 0 > /proc/sys/net/ipv4/tcp_abort_on_overflow
echo 1500 > /proc/sys/net/ipv4/tcp_base_mss
echo 1 > /proc/sys/net/ipv4/tcp_dsack
echo 1 > /proc/sys/net/ipv4/tcp_fack
echo 1 > /proc/sys/net/ipv4/tcp_fin_timeout
echo 2 > /proc/sys/net/ipv4/tcp_keepalive_intvl
echo 3 > /proc/sys/net/ipv4/tcp_keepalive_probes
echo 2 > /proc/sys/net/ipv4/tcp_keepalive_time
echo 128 > /proc/sys/net/ipv4/tcp_max_orphans
echo 6000 > /proc/sys/net/ipv4/tcp_max_tw_buckets
echo 2 > /proc/sys/net/ipv4/tcp_retries1
echo 1 > /proc/sys/net/ipv4/tcp_orphan_retries
echo 2 > /proc/sys/net/ipv4/tcp_retries2
echo 1 > /proc/sys/net/ipv4/tcp_sack
echo 1 > /proc/sys/net/ipv4/tcp_syncookies
echo 2 > /proc/sys/net/ipv4/tcp_syn_retries
echo 1 > /proc/sys/net/ipv4/tcp_timestamps
echo 1 > /proc/sys/net/ipv4/tcp_tw_recycle
echo 1 > /proc/sys/net/ipv4/tcp_tw_reuse
echo "1025 65535" > /proc/sys/net/ipv4/ip_local_port_range
echo 204800 > /proc/sys/net/core/netdev_max_backlog
echo 204800 > /proc/sys/net/core/somaxconn

if [ $? -ne 0 ];then
	echo 65534 > /proc/sys/net/core/somaxconn	
fi

echo 204800 > /proc/sys/net/ipv4/tcp_max_syn_backlog
echo 2 > /proc/sys/net/ipv4/tcp_synack_retries


}


memory=`awk '($1 == "MemTotal:"){print $2/1048576}' /proc/meminfo`

if [ $(echo "$memory >=128" | bc) -eq 1 ];then
        big_memory
else
        small_memory              
fi

tcp_flag

exit 0


