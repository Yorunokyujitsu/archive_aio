# archive_aio
  - **Build ASAP ([Korean](https://github.com/Yorunokyujitsu/archive_aio/blob/main/misc/docs/README_KR.md))**
  - If just need an AIO installer, download **[ASAP.exe](https://github.com/Yorunokyujitsu/archive_aio/releases/latest/download/ASAP.exe)**.

## Source Code
- Run [Git bash](https://git-scm.com/downloads) or Terminal and clone repo.
- If don't have Git, just download the **[Source Code](https://github.com/Yorunokyujitsu/archive_aio/archive/refs/heads/main.zip)**.

## extra.7z
- extra.7z is encrypted, password is `last build date`.

## How to build on Windows
- Run `ASAP.bat` and enter command `DOWN`.
- Install **[MSYS2.exe](https://github.com/msys2/msys2-installer/releases/latest)** in `./msys64` & **[Python.exe](https://www.python.org/downloads)** by checking the items.
```
✅ Use admin privileges when installing py.exe
✅ Add python.exe to PATH
```
- Enter commands `KEYS` > `PREP` > `MAKE` > extra.7z password.

## Rebuild with latest repos
- This runs *Updating old repos* > *Building* > *Packaging*.
- **[archive_aio](https://github.com/Yorunokyujitsu/archive_aio)** must have been built at least once.
- Run `ASAP.bat` and enter command `UPDATE`.

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
- Install devkitpro.
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
- **[MSYS2](https://www.msys2.org/)** : [MSYS2](https://github.com/msys2/msys2-installer) ┃ **Python** : [Python](https://www.python.org) ┃ **[stahlworks](http://stahlworks.com/)** : [zip.exe](http://stahlworks.com/dev/zip.exe), [unzip.exe](http://stahlworks.com/dev/unzip.exe)

- **[switchbrew](https://github.com/switchbrew)** : [libnx](https://github.com/switchbrew/libnx), [nx-hbloader](https://github.com/switchbrew/nx-hbloader) ┃ **[ITotalJustice](https://github.com/ITotalJustice)** : [sphaira](https://github.com/ITotalJustice/sphaira) ┃ **Patches** : [borntohonk](https://github.com/borntohonk)

- **[CTCaer](https://github.com/CTCaer)** : [Hekate & Nyx](https://github.com/CTCaer/hekate) ┃ **[Atmosphère-NX](https://github.com/Atmosphere-NX)** : [Atmosphère, Daybreak, Reboot to payload](https://github.com/Atmosphere-NX/Atmosphere)

- **[Asa](https://github.com/Asadayot)** : **[ASAP Installer](https://github.com/Yorunokyujitsu/archive_aio/releases/latest/download/ASAP.exe)**, ATLAS, [atmo_logo_creator](https://github.com/Yorunokyujitsu/atmo_logo_creator) <br> **[shchmue](https://github.com/shchmue)** : Lockpick RCM ┃ **[suchmememanyskill](https://github.com/suchmememanyskill)** : [TegraExplorer](https://github.com/suchmememanyskill/TegraExplorer)

- **[HamletDuFromage](https://github.com/HamletDuFromage)** : [aio-switch-updater](https://github.com/HamletDuFromage/aio-switch-updater) ┃ **[Slluxx](https://github.com/Slluxx)** : [AmiiboGenerator](https://github.com/Slluxx/AmiiboGenerator) <br> **[duckbill](https://gbatemp.net/search/9668717/?c[users]=duckbill007&o=date)** : [DBI](https://github.com/rashevskyv/dbi) ┃ **[J-D-K](https://github.com/J-D-K)** : [JKSV](https://github.com/J-D-K/JKSV) ┃ **[rdmrocha](https://github.com/rdmrocha)** : [Linkalho](https://github.com/rdmrocha/linkalho) ┃ **[blawar](https://tinfoil.io/)** : [Tinfoil](https://tinfoil.io/)

- **[ppkantorski](https://github.com/ppkantorski)** : [Ultrahand-Overlay](https://github.com/ppkantorski/Ultrahand-Overlay), [nx-ovlloader](https://github.com/ppkantorski/nx-ovlloader), [ovl-sysmodules](https://github.com/ppkantorski/ovl-sysmodules) <br> **[ndeadly](https://github.com/ndeadly)** : [MissionControl](https://github.com/ndeadly/MissionControl) ┃ **[Zathawo](https://github.com/Zathawo)** : [NX-FanControl](https://github.com/Zathawo/NX-FanControl) ┃ **[o0Zz](https://github.com/o0Zz)** : [sys-con](https://github.com/o0Zz/sys-con) <br> **[masagrator](https://github.com/masagrator)** : [SaltyNX](https://github.com/masagrator/SaltyNX), [FPSLocker](https://github.com/masagrator/FPSLocker), [ReverseNX-RT](https://github.com/masagrator/ReverseNX-RT), [Status-Monitor-Overlay](https://github.com/masagrator/Status-Monitor-Overlay) <br> **[hanai3Bi](https://discord.gg/KJQdJnKWqa)** : [sys-clk-oc, sys-clk-manager](https://discord.gg/KJQdJnKWqa) ┃ **[halop](https://github.com/halop)** : [OC-Switchcraft-EOS, loader.kip](https://github.com/halop/OC-Switchcraft-EOS) <br> **[XorTroll](https://github.com/XorTroll)** : [emuiibo](https://github.com/XorTroll/emuiibo) ┃ **[proferabg](https://github.com/proferabg)** : [EdiZon-Overlay](https://github.com/proferabg/EdiZon-Overlay) ┃ **[NaGaa95](https://github.com/NaGaa95)** : [UltraCam](https://github.com/NaGaa95/Ultracam-Overlay)

- **[Team-Neptune](https://github.com/Team-Neptune)** : [DeepSea](https://github.com/Team-Neptune/DeepSea) ┃ **[rashevskyv](https://github.com/rashevskyv)** : [Kefir](https://github.com/rashevskyv/kefir) <br> **[sthetix](https://www.sthetix.info)** : [HATS, INSTINCT-Toolbox](https://filedn.com/lric62b9t2vz5v4OvwHkKJS/HATS) ┃ **[CatcherITGF](https://github.com/CatcherITGF)** : [NX-Venom](https://github.com/CatcherITGF/NX-Venom)

- **TEAM-XECUTER** : SX Gear ┃ **[Spacecraft-NX](https://github.com/Spacecraft-NX)** : [Spacecraft](https://github.com/Spacecraft-NX/firmware) ┃ **[Hwfly-nx](https://github.com/hwfly-nx)** : [Hwfly](https://github.com/hwfly-nx/firmware), [Hwfly-Toolbox](https://github.com/hwfly-nx/hwfly-toolbox) <br> **[INSTINCT-NX](https://drive.google.com/drive/folders/16A9lhFMS_zuNKO6AZEB2QH8XLo7skx86)** : [INSTINCT](https://drive.google.com/drive/folders/16A9lhFMS_zuNKO6AZEB2QH8XLo7skx86) ┃ **[rehius](https://github.com/rehius)** : [Picofly](https://github.com/rehius/usk), [Picofly-Toolbox](https://gbatemp.net/threads/picofly-a-hwfly-switch-modchip.622701/page-78#post-10090767)