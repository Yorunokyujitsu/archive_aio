#!/bin/bash

# info: directory/file path & settings
source config.sh
HEADER="Packaging the compiled ASAP components"
MESSAGE_0=""
MESSAGE_1="ASAP packaging successfully"
MESSAGE_2=""

# info: work flow
ASAP_workflow() {
    print_header
    pack_asap
    pack_ultrahand
    pack_tester
    pack_updater
    print_message
    sleep 5
    exit
}

logging
ASAP_workflow