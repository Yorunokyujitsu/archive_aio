#!/bin/bash

# info: directory/file path & settings
source config.sh
HEADER="build ASAP & packaging"
MESSAGE_0=""
MESSAGE_1="Build & packaging ASAP successfully"
MESSAGE_2=""

# info: work flow
ASAP_workflow() {
    print_header
    git_clone_repo
    del_updater_tegra
    unzip_extra
    atmo_builtin_patch
    sak_keys
    create_outdir
    create_AIS
    create_logos
}

logging
ASAP_workflow
build_ASAP
packaging_all
print_message