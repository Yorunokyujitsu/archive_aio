#!/bin/bash

# info: directory/file path & settings
source config.sh
HEADER="Update repositories"
MESSAGE_0=""
MESSAGE_1="All update & build completed"
MESSAGE_2=""

# info: work flow
ASAP_workflow() {
    print_header
    update_repo
    print_message
}

logging
ASAP_workflow
build_ASAP
./packaging.sh