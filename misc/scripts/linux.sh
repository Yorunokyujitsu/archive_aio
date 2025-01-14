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
    del_updater_tegra
    curl -L -o "${TOP_DIR}/${FILE_8}" "${EX_URL}"
    unzip_extra
    create_logos
    create_outdir
    make_repo
    build_sphaira
    make_splash
    make_ultrahand
    pack_asap
}

logging
ASAP_workflow
print_message