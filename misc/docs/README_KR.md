# archive_aio
  - **ASAP 간편 빌드 툴**
  - 인스톨러만 필요한 경우 **[ASAP.exe](https://blog.kakaocdn.net/dn/cgqCfh/btsGT8BHpZZ/ng4cBvvHU9R8fcEEngwhbk/ASAP.exe?attach=1&knm=tfile.exe)** 다운로드.

## 소스 코드
- [Git bash](https://git-scm.com/downloads) 혹은 터미널을 이용하여 저장소를 복제.
- Git이 없다면 **[Source Code](https://github.com/Yorunokyujitsu/archive_aio/archive/refs/heads/main.zip)** 를 다운로드.

## extra.7z
- extra.7z 은 암호화되어 있으며, 패스워드는 `ASAP` + 마지막 빌드일입니다.

## Windows 에서 빌드하는 방법
- `ASAP.bat`을 실행하여 `DOWN` 커맨드 입력.
- `./msys64`경로에 **[MSYS2.exe](https://github.com/msys2/msys2-installer/releases/latest)** 설치 & **[Python.exe](https://www.python.org/downloads)** 은 다음 사항을 체크하여 설치.
```
✅ Use admin privileges when installing py.exe
✅ Add python.exe to PATH
```
- 설치 완료 후, `KEYS` > `PREP` > `MAKE` > extra.7z 패스워드 순으로 커맨드를 입력.

## 최신 저장소로 다시 빌드하는 방법
- 이것은 *오래된 저장소를 업데이트* > *리빌드* > *패키징* 을 실행합니다.
- **[archive_aio](https://github.com/Yorunokyujitsu/archive_aio)** 를 적어도 1회 이상 빌드했었어야 합니다.
- `ASAP.bat` 을 실행하여 `UPDATE` 커맨드 입력. 

## Linux 에서 빌드하는 방법
<details><summary>PC 환경에 따라 다를 수 있습니다.</summary>
  
- 유틸리티 & 파이썬 라이브러리 설치.
```
sudo apt install lz4 zip git make gcc python3 python-is-python3 python3-pip 
sudo pip install py pillow pycryptodome lz4 numpy

# 먄약 우분투 버전이 22.04 ~ 일 경우
sudo apt update
sudo apt install lz4 zip git make gcc python3 python-is-python3 python3-py python3-pip python3-pil python3-pycryptodome python3-lz4 python3-numpy
```
- devkitpro 설치.
```
wget https://apt.devkitpro.org/install-devkitpro-pacman
chmod +x ./install-devkitpro-pacman
sudo ./install-devkitpro-pacman
```
- devkitpro-pacman 패키지 설치.
```
sudo dkp-pacman -Syuu --needed --noconfirm \
    devkitA64 devkitARM dkp-toolchain-vars hactool \
    switch-dev switch-sdl2_image switch-sdl2_gfx switch-glad switch-glfw switch-glm \
    switch-freetype switch-libconfig switch-libjson-c switch-physfs \
    switch-curl switch-zziplib switch-mbedtls switch-jansson switch-tinyxml2
```
- devkitpro에 대한 환경변수 설정.
```
export DEVKITPRO=/opt/devkitpro
export DEVKITARM=/opt/devkitpro/devkitARM
export DEVKITPPC=/opt/devkitpro/devkitPPC
```
- 저장소를 빌드.
```
cd archive_aio/misc/scripts
chmod +x linux.sh
./linux.sh
```

</details>

## 크레딧
- **[MSYS2](https://www.msys2.org/)** : [MSYS2](https://github.com/msys2/msys2-installer) ┃ **Python** : [Python](https://www.python.org) ┃ **[stahlworks](http://stahlworks.com/)** : [zip.exe](http://stahlworks.com/dev/zip.exe), [unzip.exe](http://stahlworks.com/dev/unzip.exe) ┃ **[dezem](https://github.com/dezem)** : [SAK](https://github.com/dezem/SAK) <br>
- **[switchbrew](https://github.com/switchbrew)** : [libnx](https://github.com/switchbrew/libnx), [nx-hbloader](https://github.com/switchbrew/nx-hbloader), [nx-hbmenu](https://github.com/switchbrew/nx-hbmenu) ┃ **Patches** : [ITotalJustice](https://github.com/ITotalJustice), [mrdude2478](https://github.com/mrdude2478) <br>

- **[Asa](https://github.com/Asadayot)** : AIS(ASAP Install Supporter), [atmo_logo_creator](https://github.com/Yorunokyujitsu/atmo_logo_creator)<br>
**[CTCaer](https://github.com/CTCaer)** : [Hekate & Nyx](https://github.com/CTCaer/hekate) ┃ **[Atmosphère-NX](https://github.com/Atmosphere-NX)** : [libnx](https://github.com/Atmosphere-NX/libnx), [Atmosphère, Haze, Daybreak, Reboot to payload](https://github.com/Atmosphere-NX/Atmosphere) <br>

- **[shchmue](https://github.com/shchmue)** : **Lockpick RCM** ┃ **[suchmememanyskill](https://github.com/suchmememanyskill)** : **[TegraExplorer](https://github.com/suchmememanyskill/TegraExplorer)** <br>

- **[HamletDuFromage](https://github.com/HamletDuFromage)** : [aio-switch-updater](https://github.com/HamletDuFromage/aio-switch-updater) ┃ **[J-D-K](https://github.com/J-D-K)** : [JKSV](https://github.com/J-D-K/JKSV) ┃ **[rdmrocha](https://github.com/rdmrocha)** : [Linkalho](https://github.com/rdmrocha/linkalho) ┃ **[Tinfoil](https://tinfoil.io/)** : [Tinfoil](https://tinfoil.io/)

- **[retronx-team](https://github.com/retronx-team)** : [sys-clk, sys-clk-manager](https://github.com/retronx-team/sys-clk) ┃ **[B3711](https://discord.gg/KJQdJnKWqa)** : [sys-clk-oc](https://discord.gg/KJQdJnKWqa) ┃ **[halop](https://github.com/halop)** : [OC Toolkit - OC Switchcraft EOS](https://github.com/halop/OC_Toolkit) <br>
**[WerWolv](https://github.com/WerWolv)** : [nx-ovlloader](https://github.com/WerWolv/nx-ovlloader), [ovl-sysmodules](https://github.com/WerWolv/ovl-sysmodules) ┃ **[ppkantorski](https://github.com/ppkantorski)** : [Ultrahand-Overlay](https://github.com/ppkantorski/Ultrahand-Overlay) ┃ **[proferabg](https://github.com/proferabg)** : [EdiZon-Overlay](https://github.com/proferabg/EdiZon-Overlay) <br>
**[XorTroll](https://github.com/XorTroll)** : [emuiibo](https://github.com/XorTroll/emuiibo) ┃ **[masagrator](https://github.com/masagrator)** : [SaltyNX](https://github.com/masagrator/SaltyNX), [FPSLocker](https://github.com/masagrator/FPSLocker), [ReverseNX-RT](https://github.com/masagrator/ReverseNX-RT), [Status-Monitor-Overlay](https://github.com/masagrator/Status-Monitor-Overlay) <br>

- **[ndeadly](https://github.com/ndeadly)** : [MissionControl](https://github.com/ndeadly/MissionControl) ┃ **[o0Zz](https://github.com/o0Zz)** : [sys-con](https://github.com/o0Zz/sys-con) <br>

- **[Team-Neptune](https://github.com/Team-Neptune)** : [DeepSea](https://github.com/Team-Neptune/DeepSea) ┃ **[rashevskyv](https://github.com/rashevskyv)** : [Kefir](https://github.com/rashevskyv/kefir), [DBI](https://github.com/rashevskyv/dbi), [Kefirosphere](https://github.com/rashevskyv/Kefirosphere) <br> **[sthetix](https://www.sthetix.info)** : [HATS, INSTINCT-Toolbox](https://filedn.com/lric62b9t2vz5v4OvwHkKJS/HATS) ┃ **[CatcherITGF](https://github.com/CatcherITGF)** : [NX-Venom](https://github.com/CatcherITGF/NX-Venom) <br>

- **TEAM-XECUTER** : SX Gear ┃ **[Spacecraft-NX](https://github.com/Spacecraft-NX)** : [Spacecraft](https://github.com/Spacecraft-NX/firmware) ┃ **[Hwfly-nx](https://github.com/hwfly-nx)** : [Hwfly](https://github.com/hwfly-nx/firmware), [Hwfly-Toolbox](https://github.com/hwfly-nx/hwfly-toolbox) <br>
**[INSTINCT-NX](https://drive.google.com/drive/folders/16A9lhFMS_zuNKO6AZEB2QH8XLo7skx86)** : [INSTINCT](https://drive.google.com/drive/folders/16A9lhFMS_zuNKO6AZEB2QH8XLo7skx86) ┃ **[rehius](https://github.com/rehius)** : [Picofly](https://github.com/rehius/usk), [Picofly-Toolbox](https://gbatemp.net/threads/picofly-a-hwfly-switch-modchip.622701/page-78#post-10090767)