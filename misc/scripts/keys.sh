#!/bin/bash

# info: directory/file path & settings
source config.sh
HEADER="Get ${VER_5} prod.keys & DevkitPro cypher key/keyring"
MESSAGE_0=""
MESSAGE_1="Keys setting complete"
MESSAGE_2=""

# info: work flow
ASAP_workflow() {
    print_header
    prod_keys

    if [ ! -f "${SCRIPT_DIR}/${STATE_FILE}_keys" ]; then
        get_devkitpro_key_keyring
        touch "${SCRIPT_DIR}/${STATE_FILE}_keys"
    fi

    print_message
    sleep 5
    exit    
}

logging
ASAP_workflow