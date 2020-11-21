#!/bin/sh

# TODO: find a way to not hardcode this value
KEY=12345

{ [ -s "$XDG_CONFIG_HOME" ] && \
    MENU_CONFIG_DIR=$XDG_CONFIG_HOME/yad-menu; } ||\
    MENU_CONFIG_DIR=$HOME/.config/yad-menu

# if folder does not exist, create it
[ -d "$MENU_CONFIG_DIR" ] || mkdir $MENU_CONFIG_DIR -p || exit 1


TABLIST=""
declare -i TABNUM=1
# search for executables in the config directory
for module in $(find $MENU_CONFIG_DIR -maxdepth 1 -executable -type f )
do
    # strip out the path and extension, add a tab to the list
    TABLIST+="--tab="`echo $module | sed 's/^.*\///; s/\.[^.]*$//'`" "
    $module $KEY $TABNUM&
    TABNUM+=1
done

 yad --notebook \
     --tab-pos=left \
    --key=$KEY \
    --title="Settings" \
    $TABLIST
