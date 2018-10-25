This document outlines the manual process for applying custom firmware patches from an ecosystem partner for the NVidia Jetson TX2 platform. 

The example process will showcase the process for rebulding the default L4T package for 28.2.1 with Auvidea's 1.6 firmware for the J120 carrier board.

Prerequisites:
- Host PC running the version of Linux required by the Jetson L4T distribution, i.e. ubuntu 16.04 for L4T 28.2.1
- You will need a NVidia developer account to download the required files - (Link)[https://developer.nvidia.com/developer-program]
- Download the required files from NVidia
    - The package for the verison of L4T required, i.e. 28.2.1. Hint: click the url located under Driver Packages - (link)[https://developer.nvidia.com/linux-tegra]
    - The sample root file system package for the version of L4T required. i.e. 28.2.1. Hint: click the url located under Sample Root Filesystem - (link)[https://developer.nvidia.com/linux-tegra]
    - The binary tree files from the ecosystem partner, i.e. from Auvidea, etc. (link, FOR THIS EXAMPLE ONLY!)[https://auvidea.com/firmware/]

Notes:
- ${L4T_VERSION} refers to the version of L4T your build requires, i.e. 28.2.1

WARNING: these steps are FOR THIS EXAMPLE ONLY. You will replace some of the files specified with the files required by your build.

Steps:
- Open a terminal in the directory that you downloaded the required files to.
- To build the custom binaries for flashing, run the following commands in order:
    - sudo tar xpf Tegra186_Linux_R${L4T_VERSION}_aarch64.tbz2
    - sudo tar xpf auvidea-kernel-J90-J120-v1.6.zip
    - cp -rf ~/auvidea-kernel-J90-J120-v1.6/auvidea_TX2_Jetpack/dtb/* ~/Downloads/Linux_for_Tegra/kernel/dtb/
    - cp -rf ~/auvidea-kernel-J90-J120-v1.6/auvidea_TX2_Jetpack/packages/* ~/Downloads/Linux_for_Tegra/kernel/
    - cp -rf ~/auvidea-kernel-J90-J120-v1.6/auvidea_TX2_Jetpack/p2771-0000.conf.common ~/Downloads/Linux_for_Tegra/
    - cp -rf ~/auvidea-kernel-J90-J120-v1.6/auvidea_TX2_Jetpack/Image ~/Downloads/Linux_for_Tegra/kernel/
    - cp -rf ~/auvidea-kernel-J90-J120-v1.6/auvidea_TX2_Jetpack/zImage ~/Downloads/Linux_for_Tegra/kernel/
    - cd Linux_for_Tegra/rootfs
    - sudo tar xpf ../../Tegra_Linux_Sample-Root-Filesystem_R${L4T_VERSION}_aarch64.tbz2
    - cd ..
    - sudo ./apply_binaries.sh
- To flash the newly built binaries, follow these steps:
    - Place the Jetson in recovery mode
    - Connect it via the micro-USB port to the host PC
    - Run this command to flash: sudo ./flash.sh jetson-tx2 mmcblk0p1

If you require the binaries to be flashed elsewhere, like emmc or SD card, then you will need to follow the flashing directions found in the L4T Quickstart Guide located on the Jetpack Downloads page.
 