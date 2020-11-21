#!/bin/sh

[ -s "$XDG_CONFIG_HOME" ] && DAMA_CONFIG_DIR=$XDG_CONFIG_HOME/dama || DAMA_CONFIG_DIR=$HOME/.config/dama

# installation will fail rather than delete user files
[ -d $DAMA_CONFIG_DIR ] && { 
    case "$1" in
        "--replace")    
            mv $DAMA_CONFIG_DIR $DAMA_CONFIG_DIR.old || {
            echo -e "aborting to avoid deleting user data.\nYou can fix this by removing one of the folders:\n$DAMA_CONFIG_DIR\n$DAMA_CONFIG_DIR.old\nor by running \`./install.sh --force-replace\` which will delete the old configuration"
            exit 
        } ;;
        "--force-replace" ) 
            rm -rf $DAMA_CONFIG_DIR ;;
        * )
            echo -e "found a previous configuration in $DAMA_CONFIG_DIR\nRun \`./install.sh --replace\` to install anyway."
            exit ;;
    esac
}

echo "now copying files to $DAMA_CONFIG_DIR"

mkdir -p $DAMA_CONFIG_DIR
cp ./plugins/* $DAMA_CONFIG_DIR/ -r
