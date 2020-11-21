#!/bin/sh

yad --dnd \
    --plug=$1 \
    --text="Drag and drop here any plugins you want to add to the menu" \
    --tabnum=$2 | \
    while IFS= read -r PLUGIN
    do
        cp ${PLUGIN#file://} $DAMA_CONFIG_DIR/${PLUGIN##*/}
    done
