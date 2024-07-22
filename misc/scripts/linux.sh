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
    curl -L -o "${TOP_DIR}/${FILE_8}" "${EX_URL}"
    unzip_extra
    create_logos
}

logging
ASAP_workflow
create_outdir
make_repo
make_splash
make_ultrahand_linux
pack_asap
print_message