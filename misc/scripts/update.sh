#!/bin/bash

# info: directory/file path & settings
source config.sh
HEADER="Update repositories"
MESSAGE_0=""
MESSAGE_1="All update, build & packaging completed"
MESSAGE_2=""

# info: work flow
ASAP_workflow() {
    print_header
    update_repo
    build_ASAP
    packaging_all
    print_message
    sleep 5
    exit
}

logging
ASAP_workflow