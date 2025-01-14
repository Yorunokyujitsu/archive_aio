#!/bin/bash

# info: directory/file path & settings
# info: default top directory
TOP_DIR=$(dirname "$(dirname "$(dirname "$(readlink -f "$0")")")")

# info: windows system directory
SYSTEM_DIR="/c/Windows/System32"

# info: devkitpro user directory
PC_USER=$(echo ~)

# info: defalt derectories
KEY_DIR="${TOP_DIR}/msys64/home/${PC_USER##*/}/.switch"
SAK_DIR="${TOP_DIR}/SAK/bin"

APP_DIR="${TOP_DIR}/programs/homebrews"
PCH_DIR="${TOP_DIR}/programs/patches"
OVL_DIR="${TOP_DIR}/programs/overlays"
CLK_DIR="${TOP_DIR}/programs/sys-clk"
SMD_DIR="${TOP_DIR}/programs/sysmodules"

ZIP_DIR="${TOP_DIR}/misc/swich-lib"
DEV_DIR="${TOP_DIR}/msys64/opt/devkitpro"
CFG_DIR="${TOP_DIR}/msys64/etc"

ATMO_DIR="${TOP_DIR}/Atmosphere/out/nintendo_nx_arm64_armv8a/release/atmosphere-out"
UTIL_DIR="${TOP_DIR}/Atmosphere/utilities"

OUT_DIR="${TOP_DIR}/output"
TEMP_DIR="${TOP_DIR}/ASAP-PACKAGING"

SCRIPT_DIR="${TOP_DIR}/misc/scripts"

# info: user/team
USER_1="Yorunokyujitsu"
USER_2="CTCaer"
USER_3="CatcherITGF"
USER_4="borntohonk"
USER_5="rashevskyv"

TEAM_1="msys2"
TEAM_2="switchbrew"
TEAM_3="Atmosphere-NX"
TEAM_4="Team-Neptune"

# info: branch
MASTER_BRANCH="master"
PRE_BRANCH="prerelease"
MAIN_BRANCH="main"
TEST_BRANCH="test"
TEMP_BRANCH="1900_support"
PRESET="MinSizeRel" # Release, RelWithDebInfo, MinSizeRel, Debug

# info: version
source "${TOP_DIR}/version.inc"

APP_VER="${HEKATE_VER} | ${BUILD_VER} | APP"
ASAP_VER="${HEKATE_VER} | ${BUILD_VER} | UPDATE"
TEST_VER="${HEKATE_VER} | TESTER | UPDATE"

# info: files
FILE_1="pacman.conf"
FILE_2="prod.keys"
FILE_3="devkitpro-keyring.pkg.tar.xz"

FILE_4="msys2-x86_64-${LATEST_VER}.exe"
FILE_5="python-${PYTHON_VER}-amd64.exe"
FILE_6="extra.7z"
FILE_7="zip.exe"
FILE_8="unzip.exe"

ZZIPLIB1="switch-zziplib_0.13.69-3.zip"
ZZIPLIB2="switch-zziplib_0.13.76-2.zip"

FILE_11="atmosphere-${ATMO_VER}-${MASTER_BRANCH}-${ATMO_HASH}+hbl-${HBL_VER}+hbmenu-${HBMENU_VER}.zip"
FILE_12="fusee.bin"
FILE_13="hekate_ctcaer_${HEKATE_VER}_Nyx_${NYX_VER}.zip"
FILE_14="sigpatches.zip"
FILE_15="HATS-${HATS_VER}.zip"
FILE_16="kefir${KEFIR_VER}.zip"
FILE_17="deepsea-advanced_v${DEEPSEA_VER}.zip"
FILE_18="NXVenom.zip"

UPDATE_FILE="main.zip"
LOG_FILE="build.log"
STATE_FILE=".state"

# info: keyring
KEY_1="BC26F752D25B92CE272E0F44"
KEY_2="F7FD5492264BB9D0"
FULL_KEY="${KEY_1}${KEY_2}"


# info: url
BASE_URL="https://github.com/"
RELEASE="releases/download/"
LATEST="releases/latest/download/"

MSYS2_URL="${BASE_URL}${TEAM_1}/msys2-installer/${LATEST}${FILE_4}"
PYTHON_URL="https://www.python.org/ftp/python/${PYTHON_VER}/${FILE_5}"
DEVKITPRO_URL="https://pkg.devkitpro.org"
KEYRING_URL="${DEVKITPRO_URL}/${FILE_3}"
KEY_SERVER_URL="keyserver.ubuntu.com"
ZIP_URL="http://stahlworks.com/dev/${FILE_7}"
UNZIP_URL="http://stahlworks.com/dev/${FILE_8}"
#PRODKEYS_URL="https://sigmapatches.su/${FILE_2}"
PRODKEYS_URL="https://blog.kakaocdn.net/dn/d2ISeq/btsKb6PtxGC/C1HlCIztDEPgqpKajkMigk/${FILE_2}?attach=1&knm=tfile.keys"
SIGMA_URL="https://sigmapatches.su/${FILE_14}"
ASA_URL="${BASE_URL}${USER_1}"
EX_URL="${BASE_URL}${USER_1}/archive_aio/${RELEASE}Extra+/${FILE_6}"
SOURCE_URL="${BASE_URL}${USER_1}/archive_aio/archive/refs/heads/${UPDATE_FILE}"
BB_URL="${BASE_URL}${USER_4}"
LIBNX_URL="${BASE_URL}${TEAM_2}/libnx"
ATMO_URL="${BASE_URL}${TEAM_3}/Atmosphere/${RELEASE}1.8.0-${PRE_BRANCH}/${FILE_11}"
FUSEE_URL="${BASE_URL}${TEAM_3}/Atmosphere/${RELEASE}1.8.0-${PRE_BRANCH}/${FILE_12}"
HEKATE_URL="${BASE_URL}${USER_2}/hekate/${LATEST}${FILE_13}"
HATS_URL="https://www.mediafire.com/file_premium/${HATS_HASH}/${FILE_15}/file"
KEFIR_URL="${BASE_URL}${USER_5}/kefir/${LATEST}${FILE_16}"
NXVENOM_URL="${BASE_URL}${USER_3}/NX-Venom/${LATEST}${FILE_18}"
DEEPSEA_URL="${BASE_URL}${TEAM_4}/DeepSea/${LATEST}${FILE_17}"

EEVEE_URL='{"url":"https://tiny.cc/eeveesaveproject","title":"Eevee Save Project","enabled":0}'
ECCHI_URL='{"url":"https://e.cchi.me/","title":"Ecchi Save Project","enabled":1}'
NXSAVE_URL='{"url":"https://nx-saves.ghostland.at/","title":"NX Saves","enabled":1}'
ATHEME_URL='{"url":"https://a-theme.ca/","title":"The A-Theme","enabled":0}'
LIBERA1_URL='{"url":"https://liberashop.rs/","title":"LiberaShop","enabled":0}'
LIBERA2_URL='{"url":"https://liberashop.rs/roms","title":"LiberaShop Retro ROMs","enabled":0}'
GHOST1_URL='{"url":"https://nx-meta.nlib.cc/","title":"Custom NX DB","enabled":1}'
GHOST2_URL='{"url":"https://nx.ghostland.at/","title":"Ghost eShop","enabled":1}'
GHOST3_URL='{"url":"https://nx-retro.ghostland.at/","title":"Ghost eShop RETRO","enabled":1}'
ULTRA_URL='{"url":"https://tinfoil.ultranx.ru","title":"UltraNX","enabled":1}'

# info: utilitys
PACMAN="pacman -Syuu --needed --noconfirm"
DEFAULT_P="git gcc make cmake curl zip lz4 p7zip"
DEVKIT_P="devkitA64 devkitARM dkp-toolchain-vars hactool"
PYTHON_P="python-pip python-setuptools python-certifi"
MINGWPY_P="mingw-w64-x86_64-python-pip mingw-w64-x86_64-python-pycryptodome mingw-w64-x86_64-python-lz4 mingw-w64-x86_64-python-psutil mingw-w64-x86_64-python-numpy"
MINGWUT_P="mingw-w64-x86_64-cmake mingw-w64-x86_64-gcc mingw-w64-x86_64-libjpeg-turbo mingw-w64-x86_64-zlib mingw-w64-x86_64-libtiff mingw-w64-x86_64-freetype"
SWITCH_P1="switch-dev switch-sdl2_image switch-sdl2_gfx switch-glad switch-glfw switch-glm"
SWITCH_P2="switch-cmake switch-harfbuzz switch-freetype switch-libconfig switch-libjson-c switch-physfs"
SWITCH_P3="switch-curl switch-zziplib switch-mbedtls switch-jansson switch-tinyxml2"
PIP_P="install certifi pyinstaller py lz4 pillow pycryptodome requests"


# info: logging
logging() {
    rm -rf "${TOP_DIR}/build.log"
    exec > >(tee -a "${TOP_DIR}/${LOG_FILE}") 2>&1
}


# info: header
print_header() {
    local header=${1:-${HEADER}}
    local line_len=100
    local header_len=${#header}
    local padding=$(( (line_len - header_len) / 2 ))
    local pad=$(printf '%*s' $padding '')
    local line=$(printf '%*s' $line_len '')

    echo ""
    echo "${line// /-}"
    echo "${pad// / }$header"
    echo "${line// /-}"
    echo ""
}


# info: downloads
download_programs() {
    clone "${ASA_URL}/atmo_logo_creator" "${TOP_DIR}/atmo_logo_creator"

    curl -o "${SYSTEM_DIR}/${FILE_7}" "${ZIP_URL}"
    curl -o "${SYSTEM_DIR}/${FILE_8}" "${UNZIP_URL}"
    curl -L -o "${TOP_DIR}/${FILE_6}" "${EX_URL}"
    
    if [ -f "${TOP_DIR}/${FILE_4}" ]; then
        rm -rf "${TOP_DIR}/${FILE_4}"
        rm -rf "${TOP_DIR}/${FILE_5}"
    fi
}


# info: run installers
run_installer() {
    curl -L -o "${TOP_DIR}/${FILE_4}" "${MSYS2_URL}"
    curl -o "${TOP_DIR}/${FILE_5}" "${PYTHON_URL}"
    
    start "" "${TOP_DIR}/${FILE_4}"
    start "" "${TOP_DIR}/${FILE_5}"
}


# info: all utility, packages
install_packages() {
    ${PACMAN} ${DEFAULT_P} \
        ${DEVKIT_P} \
        ${PYTHON_P} \
        ${MINGWPY_P} \
        ${MINGWUT_P} \
        ${SWITCH_P1} \
        ${SWITCH_P2} \
        ${SWITCH_P3}

    pip ${PIP_P}

    # rm -f "${TOP_DIR}/${FILE_4}"
    # rm -f "${TOP_DIR}/${FILE_5}"
}


# info: download prod.keys
prod_keys() {
    if [ ! -d "${KEY_DIR}" ]; then
        mkdir -p "${KEY_DIR}"
        echo "Created directory: ${KEY_DIR}"
    fi

    curl -o "${KEY_DIR}/${FILE_2}" "${PRODKEYS_URL}"

    echo "Downloaded ${FILE_2} file to ${KEY_DIR}/${FILE_2}"
    echo ""
}

sak_keys() {
    curl -o "${SAK_DIR}/${FILE_2}" "${PRODKEYS_URL}"
}


# info: get devkitpro cypher key
get_devkitpro_key_keyring() {
    local sections=(
        "clangarm64"
        "mingw32"
        "ucrt64"
        "clang32"
        "clang64"
    )

    for section in "${sections[@]}"; do
        if grep -qE "^\[$section\]" "${CFG_DIR}/${FILE_1}"; then
            sed -i "/^\[$section\]/,/^$/d" "${CFG_DIR}/${FILE_1}"
            echo "[$section] removed."
        else
            echo "[$section] not found."
        fi
    done

    if ! grep -qE "^\[dkp-libs\]" "${CFG_DIR}/${FILE_1}" || ! grep -qE "^\[dkp-windows\]" "${CFG_DIR}/${FILE_1}"; then
        awk -v cypher_server="${DEVKITPRO_URL}/packages" '
            /Include = \/etc\/pacman.d\/mirrorlist.msys/ {
                print; print ""; 
                print "[dkp-libs]";
                print "Server = " cypher_server;
                print "";
                print "[dkp-windows]";
                print "Server = " cypher_server "/windows/$arch";
                next
            } 1' "${CFG_DIR}/${FILE_1}" > "${CFG_DIR}/${FILE_1}.tmp" && mv "${CFG_DIR}/${FILE_1}.tmp" "${CFG_DIR}/${FILE_1}"
        echo "[dkp-libs] added to '${FILE_1}'."
        echo "[dkp-windows] added to '${FILE_1}'."
    else
        echo "[dkp-libs] already exist."
        echo "[dkp-windows] already exist."
    fi

    pacman-key --recv ${FULL_KEY} --keyserver ${KEY_SERVER_URL}
    pacman-key --lsign ${FULL_KEY}
    pacman-key -l ${FULL_KEY}
    pacman-key -l ${KEY_2}

    ${PACMAN}
    
    pacman -U --needed --noconfirm ${KEYRING_URL}    
}


# info: Unzip Extra.7z
unzip_extra() {
    cd "${TOP_DIR}"
    7z x -y "${FILE_6}" -o"${TOP_DIR}"
    rm -rf "${TOP_DIR}/${FILE_6}"
}

atmo_builtin_patch() {
    cp -r "${TOP_DIR}/Atmosphere/patches/${USER_4}/"* "${TOP_DIR}/Atmosphere/"
}


# info: create output dir
create_outdir() {
    mkdir -p "${OUT_DIR}/REPO"
    mkdir -p "${OUT_DIR}/SERVER"
    mkdir -p "${OUT_DIR}/AIOS"
}


# info: create fatal, logo
create_logos() {
    cd "${TOP_DIR}/atmo_logo_creator"
    python "${TOP_DIR}/atmo_logo_creator/scripts/create_logos.py"
    cp -r "${TOP_DIR}/atmo_logo_creator/output/stratosphere" "${TOP_DIR}/Atmosphere/"
    rm -rf "${TOP_DIR}/atmo_logo_creator/output"
    cd "${TOP_DIR}/"
}

# info: create AIS (ASAP.exe)
create_AIS() {
    cd "${TOP_DIR}/AIS"
    pyinstaller -F -w -n=ASAP --version-file=./details_info.py --icon=./resources/app_icon/icon_256x256.ico ./AIS.py
    cp "${TOP_DIR}/AIS/dist/ASAP.exe" "${OUT_DIR}/"
    rm -rf "${TOP_DIR}/AIS/build"
    rm -rf "${TOP_DIR}/AIS/dist"
    rm -rf "${TOP_DIR}/AIS/ASAP.spec"
}


# info: git clone
clone() {
    local repo_url=$1
    local repo_path=$2
    local branch=$3
    
    git clone --recursive ${branch:+-b $branch} "${repo_url}" "${repo_path}"
}


# info: build or cleanup project
build() {
    local project=$1
    local command=$2
    local parallel=$3

    print_header "Building $project..."
    echo "Building $project at $(date)"
    cd "$project"
    if [ "$parallel" = "y" ]; then
        $command -j$(nproc)
    else
        $command
    fi
}


# info: repositories
git_clone_repo() {
    clone "${ASA_URL}/aio-switch-updater" "${TOP_DIR}/ASAP-Updater"
    clone "${ASA_URL}/TegraExplorer" "${TOP_DIR}/ATLAS"
    clone "${ASA_URL}/Atmosphere" "${TOP_DIR}/Atmosphere"
    # clone "${ASA_URL}/nx-hbmenu" "${TOP_DIR}/hb/hbmenu"
    clone "${ASA_URL}/nx-hbloader" "${TOP_DIR}/hb/nx-hbloader"
    clone "${ASA_URL}/sphaira" "${TOP_DIR}/hb/sphaira"
    clone "${ASA_URL}/hekate" "${TOP_DIR}/hekate"
    clone "${LIBNX_URL}" "${TOP_DIR}/libnx"
    clone "${ASA_URL}/JKSV" "${APP_DIR}/JKSV"
    clone "${ASA_URL}/EdiZon-Overlay" "${OVL_DIR}/EdiZon-Overlay"
    clone "${ASA_URL}/emuiibo" "${OVL_DIR}/emuiibo" "${TEST_BRANCH}"
    clone "${ASA_URL}/FPSLocker" "${OVL_DIR}/FPSLocker"
    clone "${ASA_URL}/ovl-sysmodules" "${OVL_DIR}/ovl-sysmodules"
    clone "${ASA_URL}/ReverseNX-RT" "${OVL_DIR}/ReverseNX-RT"
    clone "${ASA_URL}/Status-Monitor-Overlay" "${OVL_DIR}/Status-Monitor-Overlay"
    clone "${ASA_URL}/NX-FanControl" "${OVL_DIR}/NX-FanControl"
    clone "${ASA_URL}/Ultrahand-Overlay" "${OVL_DIR}/Ultrahand-Overlay"
    clone "${ASA_URL}/MissionControl" "${SMD_DIR}/MissionControl"
    clone "${ASA_URL}/sys-con" "${SMD_DIR}/sys-con"
    clone "${BB_URL}/Switch-Ghidra-Guides" "${TOP_DIR}/Switch-Ghidra-Guides"
}


# info: compile repo
make_repo() {
    build "${TOP_DIR}/libnx" "make install" "y"
    build_sphaira
    build "${TOP_DIR}/Atmosphere" "make" "y"
    build "${TOP_DIR}/hekate" "make" "y"
    build "${TOP_DIR}/ASAP-Updater" "make" "n"
    build "${TOP_DIR}/ATLAS" "make" "n"
    # build "${TOP_DIR}/hb/hbmenu" "make" "y"
    build "${TOP_DIR}/hb/nx-hbloader" "make" "y"
    build "${PCH_DIR}/sys-patch" "make" "y"
    build "${PCH_DIR}/SPU" "make" "y"
    build "${APP_DIR}/JKSV" "make" "y"
    build "${APP_DIR}/Linkalho" "make" "y"
    build "${OVL_DIR}/EdiZon-Overlay" "make" "y"
    build "${OVL_DIR}/emuiibo" "make" "y"
    build "${OVL_DIR}/FPSLocker" "make" "y"
    build "${OVL_DIR}/ovl-sysmodules" "make" "y"
    build "${OVL_DIR}/ReverseNX-RT" "make" "y"
    build "${OVL_DIR}/Status-Monitor-Overlay" "make" "y"
    build "${OVL_DIR}/NX-FanControl" "make" "n"
    # build "${CLK_DIR}/sys-clk" "make" "y"
    build "${SMD_DIR}/MissionControl" "make dist" "y"
    build "${SMD_DIR}/sys-con" "make" "y"
}

# cmake sphaira - Release, RelWithDebInfo, MinSizeRel, Debug
build_sphaira() {
    cd "${TOP_DIR}/hb/sphaira"

    "${TOP_DIR}/msys64/clang64.exe" bash -c "
        export TZ=Asia/Seoul
        echo 'export TZ=Asia/Seoul' >> ~/.bashrc
        source ~/.bashrc
        rm -rf assets/romfs/themes/white_theme.ini && rm -rf assets/romfs/themes/black_theme.ini && 
        rm -rf assets/romfs/github/sphaira.json && rm -rf assets/romfs/github/ftpsrv.json && rm -rf assets/romfs/github/untitled.json
        cmake --preset ${PRESET} -DUSE_VFS_GC=0 && cmake --build --preset ${PRESET} --parallel 4
    "
    # ./build_release.sh
    cd "${TOP_DIR}/"
}

# for ASAP-Updater
del_updater_tegra() {
    rm -rf "${TOP_DIR}/ASAP-Updater/TegraExplorer"
    rm -rf "${TOP_DIR}/ASAP-Updater/custom_packs.json"
    rm -rf "${TOP_DIR}/ASAP-Updater/hide_tabs.json"
    rm -rf "${TOP_DIR}/ASAP-Updater/internet.json"
    rm -rf "${TOP_DIR}/ASAP-Updater/jc_profiles.json"
    rm -rf "${TOP_DIR}/ASAP-Updater/pc_profiles.json"
}

# info: 8gb ram
build_for_8gb() {
    mkdir -p "${TOP_DIR}/Atmosphere/ram/8gb/atmosphere" && mkdir -p "${TOP_DIR}/Atmosphere/ram/8gb/bootloader/payloads"
    mkdir -p "${TOP_DIR}/hekate/ram/8gb/bootloader/sys"
    
    cp "${TOP_DIR}/Atmosphere/out/nintendo_nx_arm64_armv8a/release/atmosphere-out/atmosphere/package3" "${TOP_DIR}/Atmosphere/ram/8gb/atmosphere/"
    cp "${TOP_DIR}/Atmosphere/out/nintendo_nx_arm64_armv8a/release/atmosphere-out/atmosphere/reboot_payload.bin" "${TOP_DIR}/Atmosphere/ram/8gb/atmosphere/"
    cp "${TOP_DIR}/Atmosphere/out/nintendo_nx_arm64_armv8a/release/atmosphere-out/atmosphere/stratosphere.romfs" "${TOP_DIR}/Atmosphere/ram/8gb/atmosphere/"
    cp "${TOP_DIR}/Atmosphere/out/nintendo_nx_arm64_armv8a/release/atmosphere-out/bootloader/payloads/fusee.bin" "${TOP_DIR}/Atmosphere/ram/8gb/bootloader/payloads/"
    cp "${TOP_DIR}/hekate/output/hekate.bin" "${TOP_DIR}/hekate/ram/8gb/bootloader/update.bin"
    cp "${TOP_DIR}/hekate/output/hekate.bin" "${TOP_DIR}/hekate/ram/8gb/payload.bin"
    cp "${TOP_DIR}/hekate/output/libsys_lp0.bso" "${TOP_DIR}/hekate/ram/8gb/bootloader/sys/"
    cp "${TOP_DIR}/hekate/output/libsys_minerva.bso" "${TOP_DIR}/hekate/ram/8gb/bootloader/sys/"
    cp "${TOP_DIR}/hekate/output/nyx.bin" "${TOP_DIR}/hekate/ram/8gb/bootloader/sys/"
    
    build "${TOP_DIR}/Atmosphere" "make clean" "y"
    build "${TOP_DIR}/hekate" "make clean" "y"

    cp -r "${TOP_DIR}/Atmosphere/patches/4GB_RAM/exosphere" "${TOP_DIR}/Atmosphere/"
    cp -r "${TOP_DIR}/hekate/4GB_RAM/bdk" "${TOP_DIR}/hekate/"
    
    build "${TOP_DIR}/Atmosphere" "make" "y"
    build "${TOP_DIR}/hekate" "make" "y"

    mv "${TOP_DIR}/Atmosphere/ram/8gb" "${TOP_DIR}/Atmosphere/out/nintendo_nx_arm64_armv8a/release/atmosphere-out/atmosphere/"
    mv "${TOP_DIR}/hekate/ram/8gb" "${TOP_DIR}/hekate/output/"

    rm -rf "${TOP_DIR}/Atmosphere/ram"
    rm -rf "${TOP_DIR}/hekate/ram"
}

# rebuild atmosphere by converting your splash.png to splash.bin
make_splash() {
    cd "${UTIL_DIR}/"
    rm -rf "${TOP_DIR}/Atmosphere/img/splash.bin"
    cp "${ATMO_DIR}/atmosphere/package3" "${UTIL_DIR}/"
    python "${UTIL_DIR}/insert_splash_screen.py" "${TOP_DIR}/Atmosphere/img/splash.png" "${UTIL_DIR}/package3"
    cp "${UTIL_DIR}/splash.bin" "${TOP_DIR}/Atmosphere/img/"
    rm -rf "${UTIL_DIR}/splash.bin"
    rm -rf "${UTIL_DIR}/package3"
    cd "${TOP_DIR}/"
    
    build "${TOP_DIR}/Atmosphere" "make" "y"
}

# if failed make ultrahand > try zziplib package change
make_ultrahand_zziplib() {
    rm -rf "${DEV_DIR}/portlibs/switch"
    unzip "${ZIP_DIR}/${ZZIPLIB1}" -d "${DEV_DIR}"

    build "${OVL_DIR}/Ultrahand-Overlay" "make" "y"

    rm -rf "${DEV_DIR}/portlibs/switch"
    unzip "${ZIP_DIR}/${ZZIPLIB2}" -d "${DEV_DIR}"
}

make_ultrahand() {
    build "${OVL_DIR}/Ultrahand-Overlay" "make" "y"
}

# make ASAP
build_ASAP(){
    make_repo
    # make_splash
    make_ultrahand
    build_for_8gb
    cd "${TOP_DIR}/misc/scripts"
}


# info: update archive_aio repo
update_repo() {
    rm -rf "${TOP_DIR}/atmo_logo_creator"
    rm -rf "${TOP_DIR}/AIS"
    rm -rf "${TOP_DIR}/ASAP-Updater"
    rm -rf "${TOP_DIR}/ATLAS"
    rm -rf "${TOP_DIR}/Atmosphere"
    rm -rf "${TOP_DIR}/hb"
    rm -rf "${TOP_DIR}/hekate"
    rm -rf "${TOP_DIR}/libnx"
    rm -rf "${TOP_DIR}/output"
    rm -rf "${TOP_DIR}/programs"
    rm -rf "${TOP_DIR}/SAK"
    rm -rf "${TOP_DIR}/Switch-Ghidra-Guides"
    rm -rf "${SCRIPT_DIR}/.state_keys"
    rm -rf "${SCRIPT_DIR}/.state_prep"
    
    prod_keys
    install_packages
    clone "${ASA_URL}/atmo_logo_creator" "${TOP_DIR}/atmo_logo_creator"
    git_clone_repo
    del_updater_tegra
    
    curl -L -o "${TOP_DIR}/archive_aio-${UPDATE_FILE}" "${SOURCE_URL}"
    curl -L -o "${TOP_DIR}/${FILE_6}" "${EX_URL}"
    unzip "${TOP_DIR}/archive_aio-${UPDATE_FILE}" -d "${TOP_DIR}"
    
    cp -r "${TOP_DIR}/archive_aio-main/"* "${TOP_DIR}/"
    rm -rf "${TOP_DIR}/archive_aio-main"
    rm -rf "${TOP_DIR}/archive_aio-${UPDATE_FILE}"

    unzip_extra
    atmo_builtin_patch
    sak_keys

    create_outdir
    create_AIS
    create_logos

    cd "${TOP_DIR}/misc/scripts"
}


# info: packaging
pack_asap() {
    # output dir
    cd "${TOP_DIR}"
    rm -rf "${OUT_DIR}/REPO/"*
            
    # atmosphere folder
    mkdir -p "${TEMP_DIR}/atmosphere/contents/010B6ECF3B30D000/02" && mkdir -p "${TEMP_DIR}/atmosphere/contents/010B6ECF3B30D000/03"
    cp -r "${CLK_DIR}/sys-clk-oc/atmosphere" "${TEMP_DIR}/"
    cp -r "${TOP_DIR}/Atmosphere/out/nintendo_nx_arm64_armv8a/release/atmosphere-out/atmosphere" "${TEMP_DIR}/"
    cp -r "${PCH_DIR}/sys-patch/out/atmosphere/contents/420000000000000B" "${TEMP_DIR}/atmosphere/contents/010B6ECF3B30D000/02/SP"
    cp -r "${SMD_DIR}/SaltySD/0000000000534C56" "${TEMP_DIR}/atmosphere/contents/"
    cp -r "${OVL_DIR}/420000000007E51A" "${TEMP_DIR}/atmosphere/contents/"
    cp -r "${OVL_DIR}/emuiibo/emuiibo/0100000000000352" "${TEMP_DIR}/atmosphere/contents/"
    # cp -r "${SMD_DIR}/ftpsrv/420000000000011B" "${TEMP_DIR}/atmosphere/contents/"
    cp "${TOP_DIR}/hb/nx-hbloader/hbl.nsp" "${TEMP_DIR}/atmosphere/hb/"
    cp "${TOP_DIR}/hb/sphaira/build/${PRESET}/switch/sphaira/sphaira.nro" "${TEMP_DIR}/atmosphere/hb/"
    cp "${TOP_DIR}/hb/sphaira/.sphaira.nro.star" "${TEMP_DIR}/atmosphere/hb/"
    echo "${ASAP_VER}" > "${TEMP_DIR}/atmosphere/contents/010B6ECF3B30D000/03/0100B0E8EB470000"

    # ASAP folder
    mkdir -p "${TEMP_DIR}/ASAP/" && cp -r "${TOP_DIR}/ATLAS/output/atmosphere" "${TEMP_DIR}/ASAP/"
    cp "${TOP_DIR}/ASAP-Updater/ASAP-Updater.nro" "${TEMP_DIR}/ASAP/"
    cp "${APP_DIR}/JKSV/webdav.json" "${TEMP_DIR}/ASAP/"
    cp "${CLK_DIR}/sys-clk-oc/config/sys-clk/config.ini" "${TEMP_DIR}/ASAP/"
    mv "${TEMP_DIR}/atmosphere/package3" "${TEMP_DIR}/ASAP/atmosphere/"
    mv "${TEMP_DIR}/atmosphere/reboot_payload.bin" "${TEMP_DIR}/ASAP/atmosphere/"
    mv "${TEMP_DIR}/atmosphere/stratosphere.romfs" "${TEMP_DIR}/ASAP/atmosphere/"
    mv "${TEMP_DIR}/atmosphere/8gb" "${TEMP_DIR}/ASAP/atmosphere/"
    rm -rf "${TEMP_DIR}/ASAP/atmosphere/contents/010B6ECF3B30D000/01/01001FF3CDEC5000_T"

    # backup folder
    mkdir -p "${TEMP_DIR}/backup/kips/.OC" && cp "${CLK_DIR}/loader.kip" "${TEMP_DIR}/backup/kips/.OC/" && mkdir -p "${TEMP_DIR}/backup/fptsrv"

    # bootloader folder
    mkdir -p "${TEMP_DIR}/bootloader/ini"
    cp -r "${TOP_DIR}/Atmosphere/out/nintendo_nx_arm64_armv8a/release/atmosphere-out/bootloader" "${TEMP_DIR}/"
    cp -r "${TOP_DIR}/ATLAS/output/bootloader" "${TEMP_DIR}/"
    cp -r "${TOP_DIR}/hekate/CTCaer/." "${TEMP_DIR}/bootloader"
    cp -r "${TOP_DIR}/hekate/output/8gb" "${TEMP_DIR}/bootloader/"
    cp "${TOP_DIR}/ASAP-Updater/ATLAS/output/ATLAS.bin" "${TEMP_DIR}/bootloader/payloads/"
    cp "${TOP_DIR}/hekate/output/libsys_lp0.bso" "${TEMP_DIR}/bootloader/sys/"
    cp "${TOP_DIR}/hekate/output/libsys_minerva.bso" "${TEMP_DIR}/bootloader/sys/"
    cp "${TOP_DIR}/hekate/output/nyx.bin" "${TEMP_DIR}/bootloader/sys/"
    cp "${TEMP_DIR}/bootloader/hekate.bin" "${TEMP_DIR}/bootloader/update.bin"
    
    # config folder
    mkdir -p "${TEMP_DIR}/config/ASAP-assist/Controller/MissionControl" && mkdir -p "${TEMP_DIR}/config/ASAP-assist/Controller/sys-con" 
    mkdir -p "${TEMP_DIR}/config/ASAP-assist/Controller/NX-FanControl"
    mkdir -p "${TEMP_DIR}/config/ASAP-assist/Homebrews/JKSV" && mkdir -p "${TEMP_DIR}/config/ASAP-assist/Homebrews/Linkalho"
    # && mkdir -p "${TEMP_DIR}/config/ASAP-assist/Homebrews/ftpsrv"
    cp -r "${OVL_DIR}/Ultrahand-Overlay/Packages/KO/Packages" "${TEMP_DIR}/config/ASAP-assist/"
    cp -r "${TOP_DIR}/Atmosphere/out/nintendo_nx_arm64_armv8a/release/atmosphere-out/config" "${TEMP_DIR}/"
    cp -r "${OVL_DIR}/Ultrahand-Overlay/Packages/ultrahand" "${TEMP_DIR}/config/"
    cp -r "${SMD_DIR}/ftpsrv/ftpsrv" "${TEMP_DIR}/config/"
    cp -r "${SMD_DIR}/MissionControl/dist/MissionControl" "${TEMP_DIR}/config/ASAP-assist/Controller/"
    cp -r "${SMD_DIR}/sys-con/out/atmosphere/contents/690000000000000D" "${TEMP_DIR}/config/ASAP-assist/Controller/sys-con/"
    cp -r "${SMD_DIR}/sys-con/out/config/sys-con" "${TEMP_DIR}/config/ASAP-assist/Controller/sys-con/"
    cp -r "${SMD_DIR}/sys-con/out/switch" "${TEMP_DIR}/config/ASAP-assist/Controller/sys-con/"
    cp -r "${OVL_DIR}/NX-FanControl/out/atmosphere/contents/00FF0000B378D640" "${TEMP_DIR}/config/ASAP-assist/Controller/NX-FanControl/"
    cp -r "${CLK_DIR}/sys-clk-oc/switch/sys-clk-manager" "${TEMP_DIR}/config/ASAP-assist/Homebrews/"
    # cp "${SMD_DIR}/ftpsrv/ftpsrv.nro" "${TEMP_DIR}/config/ASAP-assist/Homebrews/ftpsrv/"
    cp "${APP_DIR}/JKSV/JKSV.nro" "${TEMP_DIR}/config/ASAP-assist/Homebrews/JKSV/"
    cp "${APP_DIR}/Linkalho/linkalho.nro" "${TEMP_DIR}/config/ASAP-assist/Homebrews/Linkalho/"

    # emuiibo, saltysd folder
    cp -r "${OVL_DIR}/emuiibo/emuiibo/emuiibo" "${TEMP_DIR}/"
    cp -r "${SMD_DIR}/SaltySD/SaltySD" "${TEMP_DIR}/"

    # nsp folder
    # cp -r "${TOP_DIR}/SAK/output/nsp" "${TEMP_DIR}/"

    # Switch folder
    mkdir -p "${TEMP_DIR}/switch/.overlays/.offload"
    mkdir -p "${TEMP_DIR}/switch/ASAP-Updater/" && cp "${TOP_DIR}/ASAP-Updater/.ASAP-Updater.nro.star" "${TEMP_DIR}/switch/ASAP-Updater/"
    cp -r "${TOP_DIR}/Atmosphere/out/nintendo_nx_arm64_armv8a/release/atmosphere-out/switch" "${TEMP_DIR}/"
    cp -r "${APP_DIR}/AmiiboGenerator" "${TEMP_DIR}/switch/"
    cp -r "${APP_DIR}/DBI" "${TEMP_DIR}/switch/"
    cp -r "${APP_DIR}/DBI-ru" "${TEMP_DIR}/switch/"
    cp -r "${APP_DIR}/Tinfoil" "${TEMP_DIR}/switch/"
    # cp -r "${TOP_DIR}/hb/sphaira/build/${PRESET}/switch/sphaira" "${TEMP_DIR}/switch/"
    cp -r "${CLK_DIR}/sys-clk-oc/switch/.overlays" "${TEMP_DIR}/switch/"
    cp -r "${OVL_DIR}/ReverseNX-RT/Out/switch/.overlays/ReverseNX-RT-ovl.ovl" "${TEMP_DIR}/switch/.overlays/.offload/"
    cp -r "${OVL_DIR}/NX-FanControl/out/switch/.overlays/NX-FanControl.ovl" "${TEMP_DIR}/switch/.overlays/.offload/"
    cp -r "${PCH_DIR}/sys-patch/out/switch/.overlays/sys-patch-overlay.ovl" "${TEMP_DIR}/switch/.overlays/"
    # cp "${TOP_DIR}/hb/hbmenu/hbmenu.nro" "${TEMP_DIR}/switch/"
    cp "${OVL_DIR}/emuiibo/emuiibo/emuiibo.ovl" "${TEMP_DIR}/switch/.overlays/"
    cp "${OVL_DIR}/FPSLocker/FPSLocker.ovl" "${TEMP_DIR}/switch/.overlays/"
    cp "${OVL_DIR}/EdiZon-Overlay/out/ovlEdiZon.ovl" "${TEMP_DIR}/switch/.overlays/"
    cp "${OVL_DIR}/Ultrahand-Overlay/ovlmenu.ovl" "${TEMP_DIR}/switch/.overlays/"
    cp "${OVL_DIR}/ovl-sysmodules/ovlSysmodules.ovl" "${TEMP_DIR}/switch/.overlays/"
    cp "${OVL_DIR}/Status-Monitor-Overlay/Status-Monitor-Overlay.ovl" "${TEMP_DIR}/switch/.overlays/"
    
    # warmboot_mariko folder
    cp -r "${TOP_DIR}/Atmosphere/out/nintendo_nx_arm64_armv8a/release/atmosphere-out/warmboot_mariko" "${TEMP_DIR}/"
    
    # SX_Gear
    cp "${TOP_DIR}/misc/modchip/SX/SX_Gear/boot.dat" "${TEMP_DIR}/"
    cp "${TOP_DIR}/misc/modchip/SX/SX_Gear/boot.ini" "${TEMP_DIR}/"

    # payload.bin
    mv "${TEMP_DIR}/bootloader/hekate.bin" "${TEMP_DIR}/payload.bin"

    # Create locations.conf file
    # echo '["usb:/","usbfs:/","sdmc:/","sdmc:/roms/","system:/","user:/","safe:/",'$ECCHI_URL','$NXSAVE_URL','$GHOST1_URL','$ATHEME_URL','$GHOST3_URL','$GHOST2_URL']' > "${TEMP_DIR}/ASAP/locations.conf"
    
    # zip the ASAP folder
    cd "${TEMP_DIR}"
    zip -r "${TEMP_DIR}/ASAP.zip" "./"*
    mv "${TEMP_DIR}/ASAP.zip" "${OUT_DIR}/"

    echo "ASAP.zip complete"
    echo ""
}


# info: Ultrahand+.zip
pack_ultrahand() {
    mkdir -p "${TEMP_DIR}/config/sys-clk"
    mkdir -p "${TEMP_DIR}/config/JKSV"
    mv "${TEMP_DIR}/ASAP/atmosphere/contents" "${TEMP_DIR}/atmosphere/"
    mv "${TEMP_DIR}/bootloader/hekate_ipl_.ini" "${TEMP_DIR}/bootloader/hekate_ipl.ini"
    rm -rf "${TEMP_DIR}/ASAP"
    rm -rf "${TEMP_DIR}/atmosphere/contents/010B6ECF3B30D000/01"
    rm -rf "${TEMP_DIR}/atmosphere/contents/010B6ECF3B30D000/03"
    rm -rf "${TEMP_DIR}/atmosphere/8gb"
    rm -rf "${TEMP_DIR}/bootloader/8gb"
    rm -rf "${TEMP_DIR}/bootloader/ini"
    rm -rf "${TEMP_DIR}/bootloader/payloads"
    rm -rf "${TEMP_DIR}/bootloader/res"
    rm -rf "${TEMP_DIR}/bootloader/sys"
    rm -rf "${TEMP_DIR}/bootloader/update.bin"
    rm -rf "${TEMP_DIR}/nsp"
    rm -rf "${TEMP_DIR}/switch/AmiiboGenerator"
    rm -rf "${TEMP_DIR}/switch/ASAP-Updater"
    rm -rf "${TEMP_DIR}/switch/Daybreak"
    rm -rf "${TEMP_DIR}/switch/DBI"
    rm -rf "${TEMP_DIR}/switch/DBI-ru"
    rm -rf "${TEMP_DIR}/switch/Haze"
    rm -rf "${TEMP_DIR}/switch/Reboot2payload"
    rm -rf "${TEMP_DIR}/switch/Tinfoil"
    rm -rf "${TEMP_DIR}/warmboot_mariko"
    rm -rf "${TEMP_DIR}/boot.dat"
    rm -rf "${TEMP_DIR}/boot.ini"
    rm -rf "${TEMP_DIR}/payload.bin"

    cd "${TEMP_DIR}"
    zip -r "${TEMP_DIR}/Ultrahand+.zip" "./"*
    mv "${TEMP_DIR}/Ultrahand+.zip" "${OUT_DIR}/REPO/"

    echo "Ultrahand+.zip complete"
    echo ""
}


# info: ASAP-Tester.zip
pack_tester() {
    # ASAP folder
    mkdir -p "${TEMP_DIR}/TESTER/ASAP/atmosphere/contents/010B6ECF3B30D000/02/SP"
    mkdir -p "${TEMP_DIR}/TESTER/ASAP/atmosphere/contents/010B6ECF3B30D000/03"
    mkdir -p "${TEMP_DIR}/TESTER/ASAP/atmosphere/contents/0100000000000352/flags/"
    cp -r "${TOP_DIR}/Atmosphere/out/nintendo_nx_arm64_armv8a/release/atmosphere-out/atmosphere" "${TEMP_DIR}/TESTER/ASAP/"
    cp -r "${TOP_DIR}/ATLAS/output/atmosphere" "${TEMP_DIR}/TESTER/ASAP/"
    cp -r "${TOP_DIR}/ATLAS/extra/01001FF3CDEC5000_T" "${TEMP_DIR}/TESTER/ASAP/atmosphere/contents/010B6ECF3B30D000/01/01001FF3CDEC5000"
    cp -r "${PCH_DIR}/sys-patch/out/atmosphere/contents/420000000000000B/"* "${TEMP_DIR}/TESTER/ASAP/atmosphere/contents/010B6ECF3B30D000/02/SP"
    cp -r "${PCH_DIR}/sys-patch/out/atmosphere/contents/420000000000000B/" "${TEMP_DIR}/TESTER/ASAP/atmosphere/contents/"
    cp -r "${OVL_DIR}/420000000007E51A" "${TEMP_DIR}/TESTER/ASAP/atmosphere/contents/"
    # cp -r "${SMD_DIR}/ftpsrv/420000000000011B" "${TEMP_DIR}/TESTER/ASAP/atmosphere/contents/"
    cp "${TOP_DIR}/hb/sphaira/build/${PRESET}/switch/sphaira/sphaira.nro" "${TEMP_DIR}/TESTER/ASAP/atmosphere/hb/"
    cp "${TOP_DIR}/hb/sphaira/.sphaira.nro.star" "${TEMP_DIR}/TESTER/ASAP/atmosphere/hb/"
    cp "${TOP_DIR}/hb/nx-hbloader/hbl.nsp" "${TEMP_DIR}/TESTER/ASAP/atmosphere/hb/"
    cp -r "${PCH_DIR}/sys-patch/out/switch/.overlays/sys-patch-overlay.ovl" "${TEMP_DIR}/TESTER/ASAP/"
    cp -r "${PCH_DIR}/SPU/out/switch/SPU" "${TEMP_DIR}/TESTER/ASAP/"
    echo "${TEST_VER}" > "${TEMP_DIR}/TESTER/ASAP/atmosphere/contents/010B6ECF3B30D000/03/0100B0E8EB470000"

    # backup folder
    mkdir -p "${TEMP_DIR}/TESTER/backup/kips/.OC" && cp "${CLK_DIR}/loader.kip" "${TEMP_DIR}/TESTER/backup/kips/.OC/" && mkdir -p "${TEMP_DIR}/TESTER/backup/fptsrv"

    # bootloader folder
    cp -r "${TOP_DIR}/Atmosphere/out/nintendo_nx_arm64_armv8a/release/atmosphere-out/bootloader" "${TEMP_DIR}/TESTER/"
    cp -r "${TOP_DIR}/ATLAS/output/bootloader" "${TEMP_DIR}/TESTER/"
    cp -r "${TOP_DIR}/hekate/CTCaer/." "${TEMP_DIR}/TESTER/bootloader"
    cp -r "${TOP_DIR}/hekate/output/8gb" "${TEMP_DIR}/TESTER/bootloader/"
    cp "${TOP_DIR}/ASAP-Updater/ATLAS/output/ATLAS.bin" "${TEMP_DIR}/TESTER/bootloader/payloads/"
    cp "${TOP_DIR}/hekate/output/libsys_lp0.bso" "${TEMP_DIR}/TESTER/bootloader/sys/"
    cp "${TOP_DIR}/hekate/output/libsys_minerva.bso" "${TEMP_DIR}/TESTER/bootloader/sys/"
    cp "${TOP_DIR}/hekate/output/nyx.bin" "${TEMP_DIR}/TESTER/bootloader/sys/"
    cp "${TEMP_DIR}/TESTER/bootloader/hekate.bin" "${TEMP_DIR}/TESTER/bootloader/update.bin"

    rm -rf "${TEMP_DIR}/TESTER/bootloader/res/bootscreen/atmosphere_b.bmp"
    rm -rf "${TEMP_DIR}/TESTER/bootloader/res/bootscreen/warmboot_fix.bmp"
    rm -rf "${TEMP_DIR}/TESTER/bootloader/res/icon/ASAP.bmp"
    rm -rf "${TEMP_DIR}/TESTER/bootloader/res/icon/fusee_nobox.bmp"
    rm -rf "${TEMP_DIR}/TESTER/bootloader/res/icon/ofw_sys_dark_nobox.bmp"
    rm -rf "${TEMP_DIR}/TESTER/bootloader/res/background.bmp"

    # config folder
    # mkdir -p "${TEMP_DIR}/TESTER/config/ASAP-assist/Homebrews/ftpsrv"
    cp -r "${SMD_DIR}/ftpsrv/ftpsrv" "${TEMP_DIR}/TESTER/config/"
    # cp "${SMD_DIR}/ftpsrv/ftpsrv.nro" "${TEMP_DIR}/TESTER/config/ASAP-assist/Homebrews/ftpsrv/"

    # warmboot_mariko folder
    cp -r "${TOP_DIR}/Atmosphere/out/nintendo_nx_arm64_armv8a/release/atmosphere-out/warmboot_mariko" "${TEMP_DIR}/TESTER/"

    # nsp folder
    # cp -r "${TOP_DIR}/SAK/output/nsp" "${TEMP_DIR}/TESTER/"

    # switch folder
    # mkdir "${TEMP_DIR}/TESTER/switch/"
    # cp -r "${TOP_DIR}/hb/sphaira/build/${PRESET}/switch/sphaira" "${TEMP_DIR}/TESTER/switch/"
    # cp "${TOP_DIR}/hb/hbmenu/hbmenu.nro" "${TEMP_DIR}/TESTER/switch/"

    # SX_Gear
    cp "${TOP_DIR}/misc/modchip/SX/SX_Gear/boot.dat" "${TEMP_DIR}/TESTER/"
    cp "${TOP_DIR}/misc/modchip/SX/SX_Gear/boot.ini" "${TEMP_DIR}/TESTER/"

    # payload.bin
    mv "${TEMP_DIR}/TESTER/bootloader/hekate.bin" "${TEMP_DIR}/TESTER/payload.bin"
    
    cd "${TEMP_DIR}/TESTER"
    zip -r "${TEMP_DIR}/ASAP-Tester.zip" "./"*
    mv "${TEMP_DIR}/ASAP-Tester.zip" "${OUT_DIR}/REPO/"
    cp "${OUT_DIR}/ASAP.zip" "${OUT_DIR}/REPO/ASAP-${BUILD_VER}.zip"

    echo "ASAP-Tester.zip complete"
    echo ""
}


# info: sphaira.zip
pack_sphaira() {
    mkdir -p "${TEMP_DIR}/sphaira/"
    cp "${TOP_DIR}/hb/sphaira/build/${PRESET}/switch/sphaira/sphaira.nro" "${TEMP_DIR}/sphaira/atmosphere/hb/"
    cp "${TOP_DIR}/hb/sphaira/.sphaira.nro.star" "${TEMP_DIR}/sphaira/atmosphere/hb/"
    cd "${TEMP_DIR}/sphaira"
    zip -r "${TEMP_DIR}/sphaira.zip" "./"*
    mv "${TEMP_DIR}/sphaira.zip" "${OUT_DIR}/REPO/"

    echo "sphaira.zip complete"
    echo ""
}


# info: sys-clk.zip
pack_sys_clk() {
    mkdir -p "${TEMP_DIR}/sys-clk/"
    cp -r "${CLK_DIR}/sys-clk-oc/"* "${TEMP_DIR}/sys-clk/"
    cd "${TEMP_DIR}/sys-clk"
    zip -r "${TEMP_DIR}/sys-clk.zip" "./"*
    mv "${TEMP_DIR}/sys-clk.zip" "${OUT_DIR}/REPO/"

    echo "sys-clk.zip complete"
    echo ""
}


# info: OC.Toolkit.zip
pack_oc_toolkit() {
    mkdir -p "${TEMP_DIR}/OC/"
    cp -r "${OVL_DIR}/Ultrahand-Overlay/Packages/KO/Packages/.offload/OC Toolkit/"* "${TEMP_DIR}/OC/"
    cd "${TEMP_DIR}/OC"
    zip -r "${TEMP_DIR}/OC.Toolkit.zip" "./"*
    mv "${TEMP_DIR}/OC.Toolkit.zip" "${OUT_DIR}/REPO/"

    echo "OC.Toolkit.zip complete"
    echo ""
}


# info: ASAP-Updater.zip
pack_updater() {
    mkdir -p "${TEMP_DIR}/APP/atmosphere/contents/010B6ECF3B30D000/03"
    mkdir -p "${TEMP_DIR}/APP/switch/ASAP-Updater"
    cp -r "${TOP_DIR}/ASAP-Updater/ASAP-Updater.nro" "${TEMP_DIR}/APP/switch/ASAP-Updater/"
    cp -r "${TOP_DIR}/ASAP-Updater/.ASAP-Updater.nro.star" "${TEMP_DIR}/APP/switch/ASAP-Updater/"
    echo "${APP_VER}" > "${TEMP_DIR}/APP/atmosphere/contents/010B6ECF3B30D000/03/0100B0E8EB470000"
    cd "${TEMP_DIR}/APP"
    zip -r "${TEMP_DIR}/ASAP-Updater.zip" "./"*
    mv "${TEMP_DIR}/ASAP-Updater.zip" "${OUT_DIR}/REPO/"

    rm -rf "${TEMP_DIR}"

    echo "ASAP-Updater.zip complete"
    echo ""
}


# info: ASAP PACKAGING
packaging_all() {  
    pack_asap
    pack_ultrahand
    pack_tester
    pack_sphaira
    pack_sys_clk
    pack_oc_toolkit
    pack_updater
}


# info: migration
download_migrate() {  
    cd "${TOP_DIR}/"
    rm -rf "${TEMP_DIR}"
    rm -rf "${OUT_DIR}/AIOS/"*
    rm -rf "${OUT_DIR}/SERVER/"*

    mkdir -p "${TEMP_DIR}/Origin/config"
    mkdir -p "${TEMP_DIR}/DeepSea"
    mkdir -p "${TEMP_DIR}/HATS"
    mkdir -p "${TEMP_DIR}/Kefir"
    mkdir -p "${TEMP_DIR}/NX-Venom"
    
    curl -L -o "${TOP_DIR}/migrate/Origin/${FILE_11}" "${ATMO_URL}"
    curl -L -o "${TOP_DIR}/migrate/Origin/${FILE_12}" "${FUSEE_URL}"
    curl -L -o "${TOP_DIR}/migrate/Origin/${FILE_13}" "${HEKATE_URL}"
    curl -L -o "${TOP_DIR}/migrate/DeepSea/${FILE_17}" "${DEEPSEA_URL}"
    curl -L -o "${TOP_DIR}/migrate/DeepSea/${FILE_14}" "${SIGMA_URL}"
    curl -L -o "${TOP_DIR}/migrate/HATS/${FILE_15}" "${HATS_URL}"
    curl -L -o "${TOP_DIR}/migrate/Kefir/${FILE_16}" "${KEFIR_URL}"
    curl -L -o "${TOP_DIR}/migrate/NX-Venom/${FILE_18}" "${NXVENOM_URL}"
    
    unzip "${TOP_DIR}/migrate/Origin/${FILE_11}" -d "${TEMP_DIR}/Origin/"
    unzip "${TOP_DIR}/migrate/Origin/${FILE_13}" -d "${TEMP_DIR}/Origin/"
    unzip "${TOP_DIR}/migrate/DeepSea/${FILE_17}" -d "${TEMP_DIR}/DeepSea/"
    unzip "${TOP_DIR}/migrate/DeepSea/${FILE_14}" -d "${TEMP_DIR}/DeepSea/"
    unzip "${TOP_DIR}/migrate/HATS/${FILE_15}" -d "${TEMP_DIR}/HATS/"
    unzip "${TOP_DIR}/migrate/Kefir/${FILE_16}" -d "${TEMP_DIR}/Kefir/"
    unzip "${TOP_DIR}/migrate/NX-Venom/${FILE_18}" -d "${TEMP_DIR}/NX-Venom/"
    
    mkdir "${TEMP_DIR}/Origin/atmosphere/hosts"
    cp -r "${TOP_DIR}/migrate/Origin/${FILE_12}" "${TEMP_DIR}/Origin/bootloader/payloads/"
    cp -r "${TEMP_DIR}/NX-Venom/atmosphere/hosts/emummc.txt" "${TEMP_DIR}/Origin/atmosphere/hosts/"

    echo "[exosphere]" > "${TEMP_DIR}/Origin/exosphere.ini"
    echo "debugmode=1" >> "${TEMP_DIR}/Origin/exosphere.ini"
    echo "debugmode_user=0" >> "${TEMP_DIR}/Origin/exosphere.ini"
    echo "disable_user_exception_handlers=0" >> "${TEMP_DIR}/Origin/exosphere.ini"
    echo "enable_user_pmu_access=0" >> "${TEMP_DIR}/Origin/exosphere.ini"
    echo "blank_prodinfo_sysmmc=0" >> "${TEMP_DIR}/Origin/exosphere.ini"
    echo "blank_prodinfo_emummc=1" >> "${TEMP_DIR}/Origin/exosphere.ini"
    echo "allow_writing_to_cal_sysmmc=0" >> "${TEMP_DIR}/Origin/exosphere.ini"
    echo "log_port=0" >> "${TEMP_DIR}/Origin/exosphere.ini"
    echo "log_baud_rate=115200" >> "${TEMP_DIR}/Origin/exosphere.ini"
    echo "log_inverted=0" >> "${TEMP_DIR}/Origin/exosphere.ini"

    cp -r "${TEMP_DIR}/Origin/exosphere.ini" "${TEMP_DIR}/DeepSea/"

    echo "[config]" > "${TEMP_DIR}/Origin/bootloader/hekate_ipl.ini"
    echo "autoboot=0" >> "${TEMP_DIR}/Origin/bootloader/hekate_ipl.ini"
    echo "autoboot_list=0" >> "${TEMP_DIR}/Origin/bootloader/hekate_ipl.ini"
    echo "bootwait=1" >> "${TEMP_DIR}/Origin/bootloader/hekate_ipl.ini"
    echo "noticker=0" >> "${TEMP_DIR}/Origin/bootloader/hekate_ipl.ini"
    echo "autohosoff=2" >> "${TEMP_DIR}/Origin/bootloader/hekate_ipl.ini"
    echo "autonogc=0" >> "${TEMP_DIR}/Origin/bootloader/hekate_ipl.ini"
    echo "bootprotect=0" >> "${TEMP_DIR}/Origin/bootloader/hekate_ipl.ini"
    echo "updater2p=0" >> "${TEMP_DIR}/Origin/bootloader/hekate_ipl.ini"
    echo "backlight=100" >> "${TEMP_DIR}/Origin/bootloader/hekate_ipl.ini"
    echo "" >> "${TEMP_DIR}/Origin/bootloader/hekate_ipl.ini"
    echo "[CFW (SD Card)]" >> "${TEMP_DIR}/Origin/bootloader/hekate_ipl.ini"
    echo "fss0=atmosphere/package3" >> "${TEMP_DIR}/Origin/bootloader/hekate_ipl.ini"
    echo "emummcforce=1" >> "${TEMP_DIR}/Origin/bootloader/hekate_ipl.ini"     
    echo "kip1patch=nosigchk" >> "${TEMP_DIR}/Origin/bootloader/hekate_ipl.ini"     
    echo "" >> "${TEMP_DIR}/Origin/bootloader/hekate_ipl.ini"
    echo "[CFW (eMMC)]" >> "${TEMP_DIR}/Origin/bootloader/hekate_ipl.ini"     
    echo "fss0=atmosphere/package3" >> "${TEMP_DIR}/Origin/bootloader/hekate_ipl.ini"     
    echo "emummc_force_disable=1" >> "${TEMP_DIR}/Origin/bootloader/hekate_ipl.ini"     
    echo "kip1patch=nosigchk" >> "${TEMP_DIR}/Origin/bootloader/hekate_ipl.ini"     
    echo "" >> "${TEMP_DIR}/Origin/bootloader/hekate_ipl.ini"
    echo "[CFW (fusee.bin)]" >> "${TEMP_DIR}/Origin/bootloader/hekate_ipl.ini"     
    echo "payload=bootloader/payloads/fusee.bin" >> "${TEMP_DIR}/Origin/bootloader/hekate_ipl.ini"     
    echo "" >> "${TEMP_DIR}/Origin/bootloader/hekate_ipl.ini"
    echo "[Warmboot Error Fix (eMMC)]" >> "${TEMP_DIR}/Origin/bootloader/hekate_ipl.ini"
    echo "fss0=atmosphere/package3" >> "${TEMP_DIR}/Origin/bootloader/hekate_ipl.ini"
    echo "stock=1" >> "${TEMP_DIR}/Origin/bootloader/hekate_ipl.ini"
    echo "emummc_force_disable=1" >> "${TEMP_DIR}/Origin/bootloader/hekate_ipl.ini"

    cd "${TEMP_DIR}/Origin/" && zip -r "${OUT_DIR}/AIOS/Hekate_${HEKATE_VER}_Atmosphere_${ATMO_VER}.zip" "./"*
    cd "${TEMP_DIR}/DeepSea/" && mv hekate_ctcaer_*.bin "${TEMP_DIR}/DeepSea/payload.bin"
    cd "${TOP_DIR}/"
    
    mv "${TOP_DIR}/migrate/DeepSea/${FILE_17}" "${OUT_DIR}/AIOS/"
    mv "${TOP_DIR}/migrate/HATS/${FILE_15}" "${OUT_DIR}/AIOS/"
    mv "${TOP_DIR}/migrate/Kefir/${FILE_16}" "${OUT_DIR}/AIOS/"
    mv "${TOP_DIR}/migrate/NX-Venom/${FILE_18}" "${OUT_DIR}/AIOS/"

    rm -rf "${TEMP_DIR}/Kefir/install.bat"
    rm -rf "${TOP_DIR}/migrate/DeepSea/${FILE_14}"
    rm -rf "${TOP_DIR}/migrate/Origin/${FILE_11}"
    rm -rf "${TOP_DIR}/migrate/Origin/${FILE_12}"
    rm -rf "${TOP_DIR}/migrate/Origin/${FILE_13}"

    echo "Other AIO packages download complete"
    echo ""    
}


# info: migrate aios
pack_migrate() {
    cd "${TEMP_DIR}/${AIO}/"
    mkdir -p "${TEMP_DIR}/${AIO}/ASAP"
    find "${TEMP_DIR}/${AIO}" -mindepth 1 -maxdepth 1 ! -name "ASAP" -exec mv -t "${TEMP_DIR}/${AIO}/ASAP/" {} +
    mkdir -p "${TEMP_DIR}/${AIO}/ASAP/atmosphere/contents/010B6ECF3B30D000/01"
    cp "${TOP_DIR}/migrate/migrate.te" "${TEMP_DIR}/${AIO}/ASAP/atmosphere/contents/010B6ECF3B30D000/01/01001FF3CDEC5000"

    mkdir -p "${TEMP_DIR}/${AIO}/bootloader/payloads"
    mkdir -p "${TEMP_DIR}/${AIO}/bootloader/res/bootscreen"
    mkdir -p "${TEMP_DIR}/${AIO}/bootloader/sys"
    
    cp "${TOP_DIR}/ASAP-Updater/ATLAS/output/ATLAS.bin" "${TEMP_DIR}/${AIO}/bootloader/payloads/"
    cp "${TOP_DIR}/migrate/${AIO}/update.bmp" "${TEMP_DIR}/${AIO}/bootloader/res/bootscreen/"
    cp "${TOP_DIR}/ATLAS/output/bootloader/sys/module" "${TEMP_DIR}/${AIO}/bootloader/sys/"
    cp "${TOP_DIR}/hekate/CTCaer/hekate_ipl.ini" "${TEMP_DIR}/${AIO}/bootloader/"

    mv "${TEMP_DIR}/${AIO}/ASAP/exosphere.ini" "${TEMP_DIR}/${AIO}/"
    mv "${TEMP_DIR}/${AIO}/ASAP/hbmenu.nro" "${TEMP_DIR}/${AIO}/"
    mv "${TEMP_DIR}/${AIO}/ASAP/payload.bin" "${TEMP_DIR}/${AIO}/"
    
    zip -r "${OUT_DIR}/SERVER/${AIO}.zip" "./"*

    echo "${AIO}.zip complete"
    echo ""    
}    


# info: Print completion message
print_message() {
    echo "${MESSAGE_0}"
    echo "${MESSAGE_1}"
    echo "${MESSAGE_2}"
}
