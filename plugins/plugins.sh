#!/bin/sh

yad --dnd \
    --plug=$1 \
    --tabnum=$2 | \
    while IFS= read -r PLUGIN
    do
        cp ${PLUGIN#file://} $DAMA_CONFIG_DIR/${PLUGIN##*/}
    done
