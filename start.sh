#!/bin/bash

if [ -z "$MINE_URL" ]; then
    echo "MINE_URL cannot be blank."; exit 1
fi

if [ -z "$MINE_WALLET" ]; then
    echo "MINE_WALLET cannot be blank."; exit 1
fi

# Default Values
if [ -z "$MINE_PASSWORD" ]; then;      MINE_PASSWORD="x";        fi
if [ -z "$MINE_THREADS" ]; then;       MINE_THREADS=1;           fi
if [ -z "$MINE_NICEHASH" ]; then;      MINE_NICEHASH=false;      fi
if [ -z "$CPU_LOW_POWER_MODE" ]; then; CPU_LOW_POWER_MODE=false; fi
if [ -z "$CPU_NO_PREFETCH" ]; then;    CPU_NO_PREFETCH=true;     fi
if [ -z "$VERBOSE_LEVEL" ]; then;      VERBOSE_LEVEL=4;          fi
if [ -z "$H_PRINT_TIME" ]; then;       H_PRINT_TIME=60;          fi
if [ -z "$PREFER_IPV4" ]; then;        PREFER_IPV4=true;         fi
if [ -z "$CALL_TIMEOUT" ]; then;       CALL_TIMEOUT=10;          fi
if [ -z "$RETRY_TIMEOUT" ]; then;      RETRY_TIMEOUT=10;         fi
if [ -z "$GIVEUP_LIMIT" ]; then;     GIVEUP_LIMIT=0;           fi


# Generate config.txt
sed -i -e "s/MINE_URL/${MINE_URL}/" \
       -e "s/MINE_WALLET/${MINE_WALLET}/" \
       -e "s/MINE_PASSWORD/${MINE_PASSWORD}/" \
       -e "s/MINE_NICEHASH/${MINE_NICEHASH}/" \
       -e "s/VERBOSE_LEVEL/${VERBOSE_LEVEL}/" \
       -e "s/H_PRINT_TIME/${H_PRINT_TIME}/" \
       -e "s/PREFER_IPV4/${PREFER_IPV4}/" \
       -e "s/CALL_TIMEOUT/${CALL_TIMEOUT}/" \
       -e "s/RETRY_TIMEOUT/${RETRY_TIMEOUT}/" \
       -e "s/GIVEUP_LIMIT/${GIVEUP_LIMIT}/" \
       /tmp/config.txt

echo '"cpu_threads_conf" : [' >> /tmp/config.txt
CPU_COUNTER=0
while [  ${CPU_COUNTER} -lt ${MINE_THREADS} ]; do
    echo '{ "low_power_mode" : '${CPU_LOW_POWER_MODE}', "no_prefetch" : '${CPU_NO_PREFETCH}', "affine_to_cpu" : '${CPU_COUNTER}' },' >> /tmp/config.txt
    let CPU_COUNTER=CPU_COUNTER+1 
done
echo '],' >> /tmp/config.txt

# Run Miner
/xmr-stak-cpu/bin/xmr-stak-cpu
