# extracts the rootfs and applies the changes to the new binaries
source config.sh

tar xvfj ./${ROOT_FS} -C ./Linux_for_Tegra/rootfs
./Linux_for_Tegra/apply_binaries.sh -r ./Linux_for_Tegra/rootfs