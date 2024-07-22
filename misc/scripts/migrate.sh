#!/bin/bash

# info: directory/file path & settings
source config.sh
HEADER="Packaging the other aio packages for ASAP-Updater"
MESSAGE_0=""
MESSAGE_1="Migrate packaging successfully"
MESSAGE_2=""

deepsea() {
    AIO="DeepSea"
    pack_migrate
}

hats() {
    AIO="HATS"
    pack_migrate
}

kefir() {
    AIO="Kefir"
    pack_migrate
}

nxvenom() {
    AIO="NX-Venom"
    pack_migrate
}

# info: work flow
ASAP_workflow() {
    print_header
    download_migrate
    deepsea
    hats
    kefir
    nxvenom
    rm -rf "${TEMP_DIR}"
    print_message
    sleep 5
    exit
}

logging
ASAP_workflow