#!/bin/bash
#echo -e $BTCD_CONF >> /root/btcd/btcd.conf
/btcd/bin/btcd -C=/root/btcd/btcd.conf $BTCD_PARAM
