#!/bin/bash

SCRIPT_DIR=$(dirname "$0")
BASE_DIR=$1

if [ -d "$BASE_DIR/my_product" ] && [ ! -L "$BASE_DIR/my_product" ]; then
    my_product="$BASE_DIR/my_product"
elif [ -d "$BASE_DIR/system/my_product" ] && [ ! -L "$BASE_DIR/system/my_product" ]; then
    my_product="$BASE_DIR/system/my_product"
else
    echo "error: No my_product dir"
    exit 1
fi

if [ -d "$BASE_DIR/my_stock" ] && [ ! -L "$BASE_DIR/my_stock" ]; then
    my_stock="$BASE_DIR/my_stock"
elif [ -d "$BASE_DIR/system/my_stock" ] && [ ! -L "$BASE_DIR/system/my_stock" ]; then
    my_stock="$BASE_DIR/system/my_stock"
else
    echo "error: No my_stock dir"
    exit 1
fi

rm -rf $my_product/app/AONService
rm -rf $my_product/app/OplusCamera
rm -rf $my_product/app/SogouInput_U_Product
rm -rf $my_product/del-app/BaiduInput_U_Product_Del
rm -rf $my_product/del-app/HeytapReader
rm -rf $my_stock/app/ADS
rm -rf $my_stock/app/Browser
rm -rf $my_stock/app/CarLink
rm -rf $my_stock/app/ChildrenSpace
rm -rf $my_stock/app/CloudService
rm -rf $my_stock/app/FileEncryption
rm -rf $my_stock/app/Instant
rm -rf $my_stock/app/InstantService
rm -rf $my_stock/app/OcrScanner
rm -rf $my_stock/app/OplusOperationManual
rm -rf $my_stock/app/OplusPhoneActivation
rm -rf $my_stock/app/OplusSecurityKeyboard
rm -rf $my_stock/app/PhoneNOAreaInquireProvider
rm -rf $my_stock/app/Pictorial
rm -rf $my_stock/app/RomUpdate
rm -rf $my_stock/app/StdSP
rm -rf $my_stock/app/TasWallet
rm -rf $my_stock/app/YMSpeechService
rm -rf $my_stock/del-app/BackupAndRestore
rm -rf $my_stock/del-app/BrowserVideo
rm -rf $my_stock/del-app/FamilyGuard
rm -rf $my_stock/del-app/FinShellWallet
rm -rf $my_stock/del-app/Gamecenter
rm -rf $my_stock/del-app/Health
rm -rf $my_stock/del-app/KeKeThemeSpace
rm -rf $my_stock/del-app/KeKeUserCenterMember
rm -rf $my_stock/del-app/Music
rm -rf $my_stock/del-app/OPBreathMode
rm -rf $my_stock/del-app/OplusDocumentsReader
rm -rf $my_stock/del-app/OplusEmail
rm -rf $my_stock/del-app/OPPOCommunity
rm -rf $my_stock/del-app/OppoCompass2
rm -rf $my_stock/del-app/OPPOStore
rm -rf $my_stock/del-app/OppoTranslation
rm -rf $my_stock/del-app/Shortcuts
rm -rf $my_stock/del-app/SoftsimRedteaRoaming
rm -rf $my_stock/del-app/Tips
rm -rf $my_stock/del-app/UPTsmService
rm -rf $my_stock/priv-app/BlackListApp
rm -rf $my_stock/priv-app/CodeBook
rm -rf $my_stock/priv-app/Cota
rm -rf $my_stock/priv-app/DCS
rm -rf $my_stock/priv-app/DeviceIntegrationService
rm -rf $my_stock/priv-app/DSF
rm -rf $my_stock/priv-app/HeyTapSpeechAssist
rm -rf $my_stock/priv-app/KeKeMarket
rm -rf $my_stock/priv-app/KeKeOplusThemeStore-CN
rm -rf $my_stock/priv-app/LinktoWindows
rm -rf $my_stock/priv-app/Metis
rm -rf $my_stock/priv-app/MyDevices
rm -rf $my_stock/priv-app/NumberRecognition
rm -rf $my_stock/priv-app/OCar
rm -rf $my_stock/priv-app/SOSHelper
rm -rf $my_stock/priv-app/TravelEngine
rm -rf $my_stock/priv-app/VideoGallery

# Import props, why do they even have these partitions?
echo "import /my_bigball/build.prop" >> $BASE_DIR/system/build.prop
echo "import /my_carrier/build.prop" >> $BASE_DIR/system/build.prop
echo "import /my_company/build.prop" >> $BASE_DIR/system/build.prop
echo "import /my_custom/build.prop" >> $BASE_DIR/system/build.prop
echo "import /my_engineering/build.prop" >> $BASE_DIR/system/build.prop
echo "import /my_heytap/build.prop" >> $BASE_DIR/system/build.prop
echo "import /my_manifest/build.prop" >> $BASE_DIR/system/build.prop
echo "import /my_preload/build.prop" >> $BASE_DIR/system/build.prop
echo "import /my_product/build.prop" >> $BASE_DIR/system/build.prop
echo "import /my_region/build.prop" >> $BASE_DIR/system/build.prop
echo "import /my_stock/build.prop" >> $BASE_DIR/system/build.prop
echo "import /my_version/build.prop" >> $BASE_DIR/system/build.prop

# remove bomb line
sed -i '/^ro\.product\.first_api_level=/d' "$BASE_DIR/my_product/build.prop"
