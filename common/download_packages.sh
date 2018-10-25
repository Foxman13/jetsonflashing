# loads the device config for download
source config.sh

curl -sL ${DRIVER_PACK_URL}/${DRIVER_PACK} -o ${DRIVER_PACK}
echo "c38f6732dce7309f02c35a640a541bc85547502d *./${DRIVER_PACK}" | sha1sum -c --strict -
curl -sL ${ROOT_FS_URL}/${ROOT_FS} -o ${ROOT_FS}
echo "c984ae017720ce4eae37ecd88325e9adcd61e2ce *./${ROOT_FS}" | sha1sum -c --strict -
curl -sL ${FIRMWARE_URL}/${FIRMWARE_PACKAGE} -o ${FIRMWARE_PACKAGE}
tar xvfj ./${DRIVER_PACK}
unzip ${FIRMWARE_PACKAGE}
