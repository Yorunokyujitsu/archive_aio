#!/bin/bash

# info: directory/file path & settings
source config.sh
HEADER="Download zip/unzip.exe, ${FILE_8}, Install Msys2/Python utilitys & packages"
MESSAGE_0=""
MESSAGE_1="Prepare setting complete"
MESSAGE_2=""

# info: work flow
ASAP_workflow() {
    print_header

    if [ ! -f "${SCRIPT_DIR}/${STATE_FILE}_prep" ]; then
        install_packages
        touch "${SCRIPT_DIR}/${STATE_FILE}_prep"
    fi

    download_programs
    print_message
    sleep 5
    exit     
}

logging
ASAP_workflow