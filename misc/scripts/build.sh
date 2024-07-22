#!/bin/bash

# info: directory/file path & settings
source config.sh
HEADER="build ASAP"
MESSAGE_0=""
MESSAGE_1="ASAP build successfully"
MESSAGE_2=""

# info: work flow
ASAP_workflow() {
    print_header
    git_clone_repo
    unzip_extra
    create_outdir
    create_AIS
    create_logos
}

logging
ASAP_workflow
build_ASAP
print_message
./packaging.sh