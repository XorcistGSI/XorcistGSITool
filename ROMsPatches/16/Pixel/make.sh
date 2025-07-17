#!/bin/bash

SCRIPT_DIR=$(dirname "$0")
BASE_DIR="$1"

if [ -d "$BASE_DIR/product" ] && [ ! -L "$BASE_DIR/product" ]; then
    product="$BASE_DIR/product"
elif [ -d "$BASE_DIR/system/product" ] && [ ! -L "$BASE_DIR/system/product" ]; then
    product="$BASE_DIR/system/product"
else
    echo "error: No product dir"
    exit 1
fi

if [ -d "$BASE_DIR/system_ext" ] && [ ! -L "$BASE_DIR/system_ext" ]; then
    system_ext="$BASE_DIR/system_ext"
elif [ -d "$BASE_DIR/system/system_ext" ] && [ ! -L "$BASE_DIR/system/system_ext" ]; then
    system_ext="$BASE_DIR/system/system_ext"
else
    echo "error: No system_ext dir"
    exit 1
fi

sed -i "/dataservice_app/d" $product/etc/selinux/product_seapp_contexts
sed -i "/dataservice_app/d" $system_ext/etc/selinux/system_ext_seapp_contexts

# Delete Google apps
rm -rf $BASE_DIR/system/app/datastatusnotification
rm -rf $BASE_DIR/system/app/QAS_DVC_MSP_VZW
rm -rf $BASE_DIR/system/app/VZWAPNLib
rm -rf $BASE_DIR/system/app/vzw_msdc_api
rm -rf $BASE_DIR/system/priv-app/CNEService
rm -rf $BASE_DIR/system/priv-app/DMService
rm -rf $BASE_DIR/system/priv-app/VzwOmaTrigger
rm -rf $BASE_DIR/system/etc/permissions/com.google.android.camera.experimental2017.xml
rm -rf $product/app/YouTube
rm -rf $product/app/YouTubeMusicPrebuilt
rm -rf $product/app/PrebuiltGmail
rm -rf $product/app/Maps
rm -rf $product/app/Drive
rm -rf $product/app/DiagnosticsToolPrebuilt
rm -rf $product/app/CalendarGooglePrebuilt
rm -rf $product/app/NgaResources
rm -rf $product/app/GoogleCamera
rm -rf $product/app/WallpapersBReel*
rm -rf $product/app/Music2
rm -rf $product/app/Photos
rm -rf $product/app/Videos
rm -rf $product/app/DevicePolicyPrebuilt
rm -rf $product/app/GoogleTTS
rm -rf $product/app/MobileFeliCaMenuMainApp
rm -rf $product/app/MobileFeliCaClient
rm -rf $product/priv-app/TurboPrebuilt
rm -rf $product/priv-app/TipsPrebuilt
rm -rf $product/priv-app/BetaFeedback
rm -rf $product/priv-app/HelpRtcPrebuilt
rm -rf $product/priv-app/MyVerizonServices
rm -rf $product/priv-app/OTAConfigPrebuilt
rm -rf $product/priv-app/RecorderPrebuilt
rm -rf $product/priv-app/SafetyHubLprPrebuilt
rm -rf $product/priv-app/ScribePrebuilt
rm -rf $product/priv-app/ConnMO
rm -rf $product/priv-app/DCMO
rm -rf $product/priv-app/SprintDM
rm -rf $product/priv-app/SprintHM
rm -rf $product/priv-app/EuiccSupportPixel
rm -rf $product/priv-app/EuiccGoogle
rm -rf $product/priv-app/WfcActivation
rm -rf $product/priv-app/AmbientSensePrebuilt
rm -rf $product/priv-app/GoogleCamera
rm -rf $product/priv-app/CarrierServices
rm -rf $system_ext/priv-app/GoogleFeedback
rm -rf $system_ext/priv-app/PixelNfc
rm -rf $BASE_DIR/system/app/NfcNci
rm -rf $system_ext/priv-app/YadaYada
rm -rf $BASE_DIR/system/priv-app/TagGoogle
rm -rf $product/app/VZWAPNLib
rm -rf $product/priv-app/AndroidAutoStubPrebuilt
rm -rf $product/priv-app/SafetyHubPrebuilt
rm -rf $product/priv-app/DreamlinerDreamsPrebuilt*
rm -rf $product/priv-app/DreamlinerPrebuilt*
rm -rf $product/priv-app/DreamlinerUpdater
rm -rf $system_ext/priv-app/HbmSVManager
rm -rf $product/overlay/PixelDocumentsUIOverlay
rm -rf $product/priv-app/Velvet
rm -rf $product/priv-app/RecorderPrebuilt*
rm -rf $product/app/arcore-1.42
rm -rf $product/app/talkback
rm -rf $product/priv-app/GoogleRestorePrebuilt*
rm -rf $product/priv-app/AdaptiveVPNPrebuilt*
rm -rf $product/priv-app/AndroidAutoStubPrebuilt
rm -rf $product/priv-app/PrebuiltDeskClockGoogle*
rm -rf $product/priv-app/PixelSupportPrebuilt
rm -rf $product/priv-app/PixelSupportPrebuilt
rm -rf $product/priv-app/WeatherPixelPrebuilt*
rm -rf $product/app/WallpaperEmojiPrebuilt*
rm -rf $product/app/WallpaperAIPrebuilt*

# Hotword
rm -rf $product/priv-app/HotwordEnrollment*
rm -rf $system_ext/framework/com.android.hotwordenrollment*
rm -rf $system_ext/framework/oat/arm/com.android.hotwordenrollment*
rm -rf $system_ext/framework/oat/arm64/com.android.hotwordenrollment*
