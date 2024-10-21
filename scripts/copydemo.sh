#!/bin/bash
for i in `seq 1 256`; do
    x=`printf "%02X\n" $i`;
    y=`printf "%03X\n" $((i+1))`;
    cat /tmp/mxd/demo | sed "s/Device (C000)/Device (C0$x)/g" | sed "s/Name (_UID, 0x01)/Name (_UID, 0x$y)/g" > /tmp/mxd/newcpu.asl
done
