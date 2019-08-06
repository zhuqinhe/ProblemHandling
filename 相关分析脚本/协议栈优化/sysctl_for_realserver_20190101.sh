function tcp_flag()
{
echo "1025 65535" > /proc/sys/net/ipv4/ip_local_port_range
echo 0 > /proc/sys/net/ipv4/tcp_abort_on_overflow

echo 204800 > /proc/sys/net/ipv4/tcp_max_syn_backlog
echo 65535 > /proc/sys/net/core/somaxconn
echo 204800 > /proc/sys/net/core/netdev_max_backlog
echo 2 > /proc/sys/net/ipv4/tcp_syn_retries
echo 2 > /proc/sys/net/ipv4/tcp_synack_retries
echo 0 > /proc/sys/net/ipv4/tcp_syncookies
echo 1 > /proc/sys/net/ipv4/tcp_timestamps

echo 3 > /proc/sys/net/ipv4/tcp_keepalive_time
echo 2 > /proc/sys/net/ipv4/tcp_keepalive_probes
echo 1 > /proc/sys/net/ipv4/tcp_keepalive_intvl

echo 128 > /proc/sys/net/ipv4/tcp_max_orphans
echo 1 > /proc/sys/net/ipv4/tcp_orphan_retries
echo 2 > /proc/sys/net/ipv4/tcp_fin_timeout

echo 1 > /proc/sys/net/ipv4/tcp_tw_reuse
echo 1 > /proc/sys/net/ipv4/tcp_tw_recycle
echo 6000 > /proc/sys/net/ipv4/tcp_max_tw_buckets
echo 2 > /proc/sys/net/ipv4/tcp_retries1
echo 2 > /proc/sys/net/ipv4/tcp_retries2
echo 1 > /proc/sys/net/ipv4/tcp_sack
echo 1 > /proc/sys/net/ipv4/tcp_dsack
echo 1 > /proc/sys/net/ipv4/tcp_fack
echo 65535 > /proc/sys/net/nf_conntrack_max
echo 10 > /proc/sys/vm/swappiness

echo "4096 1048576 2097152" > /proc/sys/net/ipv4/tcp_wmem
echo "4096 1048576 2097152" > /proc/sys/net/ipv4/tcp_rmem
echo 1048576 > /proc/sys/net/core/rmem_default
echo 1048576 > /proc/sys/net/core/wmem_default
echo 2097152 > /proc/sys/net/core/rmem_max
echo 2097152 > /proc/sys/net/core/wmem_max
}

function big_memory()
{
echo "5242880 7864320 10485760" > /proc/sys/net/ipv4/tcp_mem
}

function small_memory()
{
echo "1310720 1966080 2621440" > /proc/sys/net/ipv4/tcp_mem
}

function netfilter()
{
echo 0 > /proc/sys/net/netfilter/nf_conntrack_acct
echo 1 > /proc/sys/net/netfilter/nf_conntrack_checksum
echo 1 > /proc/sys/net/netfilter/nf_conntrack_events
echo 5 > /proc/sys/net/netfilter/nf_conntrack_events_retry_timeout
echo 256 > /proc/sys/net/netfilter/nf_conntrack_expect_max
echo 6 > /proc/sys/net/netfilter/nf_conntrack_generic_timeout
echo 1 > /proc/sys/net/netfilter/nf_conntrack_helper
echo 3 > /proc/sys/net/netfilter/nf_conntrack_icmp_timeout
echo 0 > /proc/sys/net/netfilter/nf_conntrack_log_invalid
echo 524288 > /proc/sys/net/netfilter/nf_conntrack_max
echo 0 > /proc/sys/net/netfilter/nf_conntrack_tcp_be_liberal
echo 1 > /proc/sys/net/netfilter/nf_conntrack_tcp_loose
echo 2 > /proc/sys/net/netfilter/nf_conntrack_tcp_max_retrans
echo 5 > /proc/sys/net/netfilter/nf_conntrack_tcp_timeout_close
echo 6 > /proc/sys/net/netfilter/nf_conntrack_tcp_timeout_close_wait
echo 5 > /proc/sys/net/netfilter/nf_conntrack_tcp_timeout_established
echo 3 > /proc/sys/net/netfilter/nf_conntrack_tcp_timeout_fin_wait
echo 3 > /proc/sys/net/netfilter/nf_conntrack_tcp_timeout_last_ack
echo 3 > /proc/sys/net/netfilter/nf_conntrack_tcp_timeout_max_retrans
echo 3 > /proc/sys/net/netfilter/nf_conntrack_tcp_timeout_syn_recv
echo 3 > /proc/sys/net/netfilter/nf_conntrack_tcp_timeout_syn_sent
echo 2 > /proc/sys/net/netfilter/nf_conntrack_tcp_timeout_time_wait
echo 3 > /proc/sys/net/netfilter/nf_conntrack_tcp_timeout_unacknowledged
echo 0 > /proc/sys/net/netfilter/nf_conntrack_timestamp
echo 3 > /proc/sys/net/netfilter/nf_conntrack_udp_timeout
echo 3 > /proc/sys/net/netfilter/nf_conntrack_udp_timeout_stream
}

tcp_flag
netfilter
memory=`awk '($1 == "MemTotal:"){print $2/1048576}' /proc/meminfo`
if [ $(echo "$memory >=128" | bc) -eq 1 ];then
        big_memory
else
        small_memory
fi


