# echo "Ready to flash the device. Please make sure to connect the device via USB and that it is in recovery mode."
# echo "Do you wish to continue?"
# select yn in "Yes" "No"; do
#     case $yn in
#         Yes ) ./Linux_for_Tegra/flash.sh jetson-tx2 mmcblk0p1; break;;
#         No ) exit;;
#     esac
# done
echo $1
echo $2
cd /Linux_for_Tegra/
sudo flash.sh $1 $2;