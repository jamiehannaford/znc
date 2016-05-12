#! /usr/bin/env bash

DATADIR="/home/znc/.znc"

if [ ! -f "${DATADIR}/configs/znc.conf" ]; then
    mkdir -p "${DATADIR}/configs"
    cp /znc.conf.default "${DATADIR}/configs/znc.conf"
fi

chown -R znc:znc "$DATADIR"

su -c "znc --makepem && znc --foreground --datadir=$DATADIR" -s /bin/sh znc
