#!/bin/sh
export HOME=/config/home
mkdir -p $HOME
DECONZ_OPTS="--auto-connect=1 \
        --dbg-info=$DEBUG_INFO \
        --dbg-aps=$DEBUG_APS \
        --dbg-zcl=$DEBUG_ZCL \
        --dbg-zdp=$DEBUG_ZDP \
        --dbg-otau=$DEBUG_OTAU \
        --http-port=80 \
        --ws-port=443"

if [ "$DECONZ_DEVICE" != 0 ]; then
  DECONZ_OPTS="$DECONZ_OPTS --dev=$DECONZ_DEVICE"
  chmod a+rw $DECONZ_DEVICE
fi

if [ "$DECONZ_UPNP" != 1 ]; then
  DECONZ_OPTS="$DECONZ_OPTS --upnp=0"
fi

/usr/bin/deCONZ $DECONZ_OPTS
