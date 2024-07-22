# archive_aio
  - **Build ASAP**

## Source Code
- Run [Git bash](https://git-scm.com/downloads) or Terminal and clone repo.
- If don't have Git, just download the **[Source Code](https://github.com/Yorunokyujitsu/archive_aio/archive/refs/heads/main.zip)**.

## extra.7z
- extra.7z is encrypted, please contact blog channel talk.

## How to build on Windows
- Run `ASAP.bat` and input command `DOWN`.
- Install **[MSYS2.exe](https://github.com/msys2/msys2-installer/releases/latest)** in `./msys64` & **[Python.exe](https://www.python.org/downloads)** by checking the items.
```
✅ Use admin privileges when installing py.exe
✅ Add python.exe to PATH
```
- Input commands `KEYS` > `PREP` > `MAKE` > extra.7z password

## How to build on Linux
<details><summary>It may vary depending on PC environment.</summary>
  
- Install utilities & python libraries.
```
sudo apt install lz4 zip git make gcc python3 python-is-python3 python3-pip 
sudo pip install py pillow pycryptodome lz4 numpy

# if using ubuntu 22.04 ~
sudo apt update
sudo apt install lz4 zip git make gcc python3 python-is-python3 python3-py python3-pip python3-pil python3-pycryptodome python3-lz4 python3-numpy
```
- Install devkitpro
```
wget https://apt.devkitpro.org/install-devkitpro-pacman
chmod +x ./install-devkitpro-pacman
sudo ./install-devkitpro-pacman
```
- Install devkitpro-pacman packages.
```
sudo dkp-pacman -Syuu --needed --noconfirm \
    devkitA64 devkitARM dkp-toolchain-vars hactool \
    switch-dev switch-sdl2_image switch-sdl2_gfx switch-glad switch-glfw switch-glm \
    switch-freetype switch-libconfig switch-libjson-c switch-physfs \
    switch-curl switch-zziplib switch-mbedtls switch-jansson switch-tinyxml2
```
- Setting environment variables for devkitpro.
```
export DEVKITPRO=/opt/devkitpro
export DEVKITARM=/opt/devkitpro/devkitARM
export DEVKITPPC=/opt/devkitpro/devkitPPC
```
- Build all repositories.
```
cd archive_aio/misc/scripts
chmod +x linux.sh
./linux.sh
```

</details>

## Credits
- **[MSYS2](https://www.msys2.org/)** : [MSYS2](https://github.com/msys2/msys2-installer) ┃ **Python** : [Python](https://www.python.org) ┃ **[stahlworks](http://stahlworks.com/)** : [zip.exe](http://stahlworks.com/dev/zip.exe), [unzip.exe](http://stahlworks.com/dev/unzip.exe) ┃ **[dezem](https://github.com/dezem)** : [SAK](https://github.com/dezem/SAK) <br>
- **[switchbrew](https://github.com/switchbrew)** : [libnx](https://github.com/switchbrew/libnx), [nx-hbloader](https://github.com/switchbrew/nx-hbloader), [nx-hbmenu](https://github.com/switchbrew/nx-hbmenu) ┃ **Patches** : [ITotalJustice](https://github.com/ITotalJustice), [mrdude2478](https://github.com/mrdude2478) <br>

- **[Asa](https://github.com/Asadayot)** : AIS(ASAP Install Supporter), [atmo_logo_creator](https://github.com/Yorunokyujitsu/atmo_logo_creator)<br>
**[CTCaer](https://github.com/CTCaer)** : [Hekate & Nyx](https://github.com/CTCaer/hekate) ┃ **[Atmosphère-NX](https://github.com/Atmosphere-NX)** : [libnx](https://github.com/Atmosphere-NX/libnx), [Atmosphère, Haze, Daybreak, Reboot to payload](https://github.com/Atmosphere-NX/Atmosphere) <br>

- **[shchmue](https://github.com/shchmue)** : **Lockpick RCM** ┃ **[suchmememanyskill](https://github.com/suchmememanyskill)** : **[TegraExplorer](https://github.com/suchmememanyskill/TegraExplorer)** <br>

- **[HamletDuFromage](https://github.com/HamletDuFromage)** : [aio-switch-updater](https://github.com/HamletDuFromage/aio-switch-updater) ┃ **[J-D-K](https://github.com/J-D-K)** : [JKSV](https://github.com/J-D-K/JKSV) ┃ **[rdmrocha](https://github.com/rdmrocha)** : [Linkalho](https://github.com/rdmrocha/linkalho) ┃ **[Tinfoil](https://tinfoil.io/)** : [Tinfoil](https://tinfoil.io/)

- **[retronx-team](https://github.com/retronx-team)** : [sys-clk, sys-clk-manager](https://github.com/retronx-team/sys-clk) ┃ **[B3711](https://discord.gg/KJQdJnKWqa)** : [sys-clk-oc](https://discord.gg/KJQdJnKWqa) ┃ **[halop](https://github.com/halop)** : [OC Toolkit SC, OC Toolkit EOS](https://github.com/halop/OC_Toolkit) <br>
**[WerWolv](https://github.com/WerWolv)** : [nx-ovlloader](https://github.com/WerWolv/nx-ovlloader), [ovl-sysmodules](https://github.com/WerWolv/ovl-sysmodules) ┃ **[ppkantorski](https://github.com/ppkantorski)** : [Ultrahand-Overlay](https://github.com/ppkantorski/Ultrahand-Overlay) ┃ **[proferabg](https://github.com/proferabg)** : [EdiZon-Overlay](https://github.com/proferabg/EdiZon-Overlay) <br>
**[XorTroll](https://github.com/XorTroll)** : [emuiibo](https://github.com/XorTroll/emuiibo) ┃ **[masagrator](https://github.com/masagrator)** : [SaltyNX](https://github.com/masagrator/SaltyNX), [FPSLocker](https://github.com/masagrator/FPSLocker), [ReverseNX-RT](https://github.com/masagrator/ReverseNX-RT), [Status-Monitor-Overlay](https://github.com/masagrator/Status-Monitor-Overlay) <br>

- **[ndeadly](https://github.com/ndeadly)** : [MissionControl](https://github.com/ndeadly/MissionControl) ┃ **[cathery](https://github.com/cathery)** : [sys-con](https://github.com/cathery/sys-con) <br>

- **[Team-Neptune](https://github.com/Team-Neptune)** : [DeepSea](https://github.com/Team-Neptune/DeepSea) ┃ **[rashevskyv](https://github.com/rashevskyv)** : [Kefir](https://github.com/rashevskyv/kefir), [DBI](https://github.com/rashevskyv/dbi), [Kefirosphere](https://github.com/rashevskyv/Kefirosphere) ┃ **[sthetix](https://www.sthetix.info)** : [HATS, INSTINCT-Toolbox](https://filedn.com/lric62b9t2vz5v4OvwHkKJS/HATS) <br>

- **TEAM-XECUTER** : SX Gear ┃ **[Spacecraft-NX](https://github.com/Spacecraft-NX)** : [Spacecraft](https://github.com/Spacecraft-NX/firmware) ┃ **[Hwfly-nx](https://github.com/hwfly-nx)** : [Hwfly](https://github.com/hwfly-nx/firmware), [Hwfly-Toolbox](https://github.com/hwfly-nx/hwfly-toolbox) <br>
**[INSTINCT-NX](https://drive.google.com/drive/folders/16A9lhFMS_zuNKO6AZEB2QH8XLo7skx86)** : [INSTINCT](https://drive.google.com/drive/folders/16A9lhFMS_zuNKO6AZEB2QH8XLo7skx86) ┃ **[rehius](https://github.com/rehius)** : [Picofly](https://github.com/rehius/usk), [Picofly-Toolbox](https://gbatemp.net/threads/picofly-a-hwfly-switch-modchip.622701/page-78#post-10090767)
