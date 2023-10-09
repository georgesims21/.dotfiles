#!/bin/bash
# George Sims

pnetd="/proc/net/dev"
counter=0

ret_arr() {
   echo $(cat $pnetd | grep wlp58s0 | awk '{print $2}')  # bytes_rx
   echo $(cat $pnetd | grep wlp58s0 | awk '{print $10}') # bytes_tx
   echo $(cat $pnetd | grep wlp58s0 | awk '{print $3}')  # packets_rx
   echo $(cat $pnetd | grep wlp58s0 | awk '{print $11}') # packets_tx
}

while true; do
    ARR_pre=($(ret_arr))
    sleep 1
    ARR_post=($(ret_arr))

    bytes_rx_diff=$((   ${ARR_pre[0]} - ${ARR_post[0]} ))
    bytes_tx_diff=$((   ${ARR_pre[1]} - ${ARR_post[1]} ))
    packets_rx_diff=$(( ${ARR_pre[2]} - ${ARR_post[2]} ))
    packets_tx_diff=$(( ${ARR_pre[3]} - ${ARR_post[3]} ))

    printf "%d\tBytes rx:\t%d\t||\tBytes tx:\t%d\t||\tPackets rx:\t%d\t||\tPackets tx:\t%d \n" \
        $counter $bytes_rx_diff $bytes_tx_diff $packets_tx_diff $packets_rx_diff
    (( counter++ )) # for comparison
done
