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

rm -rf $BASE_DIR/system/preload/*
rm -rf $BASE_DIR/system/hidden/*
rm -rf $BASE_DIR/system/saiv/*
rm -rf $BASE_DIR/system/tts/*

rm -rf $BASE_DIR/system/app/SamsungTTS*
rm -rf $BASE_DIR/system/app/SamsungWeather
rm -rf $BASE_DIR/system/app/SamsungCalendar
rm -rf $BASE_DIR/system/app/SmartCapture
rm -rf $BASE_DIR/system/app/BixbyWakeup
rm -rf $BASE_DIR/system/app/VideoEditorLite_Dream_N
rm -rf $BASE_DIR/system/app/StickerCenter
rm -rf $BASE_DIR/system/app/VoiceAccess
rm -rf $BASE_DIR/system/app/ParentalCare
rm -rf $BASE_DIR/system/app/FBAppManager_NS
rm -rf $BASE_DIR/system/app/AllShareAware
rm -rf $BASE_DIR/system/app/AllshareMediaShare
rm -rf $BASE_DIR/system/app/VideoTrimmer
rm -rf $BASE_DIR/system/app/VTCameraSetting
rm -rf $BASE_DIR/system/app/MhsAiService
rm -rf $BASE_DIR/system/app/MdecService
rm -rf $BASE_DIR/system/app/KidsHome_Installer
rm -rf $BASE_DIR/system/app/ChromeCustomizations
rm -rf $BASE_DIR/system/app/ARCore
rm -rf $BASE_DIR/system/app/AllshareFileShare
rm -rf $BASE_DIR/system/app/AASAservice
rm -rf $BASE_DIR/system/app/ARZone
rm -rf $BASE_DIR/system/app/PrintSpooler
rm -rf $BASE_DIR/system/app/ARDrawing
rm -rf $BASE_DIR/system/app/Weather_SEP*
rm -rf $BASE_DIR/system/app/VisionIntelligence*
rm -rf $BASE_DIR/system/app/MinusOnePage
rm -rf $BASE_DIR/system/app/Privacy
rm -rf $BASE_DIR/system/app/PhotoTable
rm -rf $BASE_DIR/system/app/AutomationTest_FB
rm -rf $BASE_DIR/system/app/DRParser
rm -rf $BASE_DIR/system/app/DictDiotekForSec
rm -rf $BASE_DIR/system/app/FactoryAirCommandManager
rm -rf $BASE_DIR/system/app/FactoryCameraFB
rm -rf $BASE_DIR/system/app/HMT
rm -rf $BASE_DIR/system/app/MoccaMobile
rm -rf $BASE_DIR/system/app/PlayAutoInstallConfig
rm -rf $BASE_DIR/system/app/SamsungPassAutofill_v1
rm -rf $BASE_DIR/system/app/SilentLog
rm -rf $BASE_DIR/system/app/SmartReminder
rm -rf $BASE_DIR/system/app/WebManual
rm -rf $BASE_DIR/system/app/WlanTest
rm -rf $BASE_DIR/system/app/SamsungOne
rm -rf $BASE_DIR/system/app/ClipboardEdge

rm -rf $BASE_DIR/system/priv-app/AppUpdateCenter
rm -rf $BASE_DIR/system/priv-app/AREmoji*
rm -rf $BASE_DIR/system/priv-app/AvatarEmojiSticker
rm -rf $BASE_DIR/system/priv-app/AppUpdateCenter
rm -rf $BASE_DIR/system/priv-app/GalaxyApps_OPEN
rm -rf $BASE_DIR/system/priv-app/PhotoRemasterService
rm -rf $BASE_DIR/system/priv-app/PhotoEditor_AIFull
rm -rf $BASE_DIR/system/priv-app/TalkbackSE
rm -rf $BASE_DIR/system/priv-app/SamsungIntelliVoiceServices
rm -rf $BASE_DIR/system/priv-app/Bixby*
rm -rf $BASE_DIR/system/priv-app/EmergencySOS
rm -rf $BASE_DIR/system/priv-app/GameDriver*
rm -rf $BASE_DIR/system/priv-app/GameHome
rm -rf $BASE_DIR/system/priv-app/GameOptimizingService
rm -rf $BASE_DIR/system/priv-app/GameTools_Dream
rm -rf $BASE_DIR/system/priv-app/PhotoRemasterService
rm -rf $BASE_DIR/system/priv-app/Routines
rm -rf $BASE_DIR/system/priv-app/SamsungVideoPlayer
rm -rf $BASE_DIR/system/priv-app/SendHelpMessage
rm -rf $BASE_DIR/system/priv-app/ShareLive
rm -rf $BASE_DIR/system/priv-app/Upday
rm -rf $BASE_DIR/system/priv-app/SamsungSmartSuggestions
rm -rf $BASE_DIR/system/priv-app/VexScanner
rm -rf $BASE_DIR/system/priv-app/DualOutFocusViewer_V
rm -rf $BASE_DIR/system/priv-app/AutoDoodle
rm -rf $BASE_DIR/system/priv-app/SingleTakeService
rm -rf $BASE_DIR/system/priv-app/StickerFaceARAvatar
rm -rf $BASE_DIR/system/priv-app/PhotoEditor_Mid
rm -rf $BASE_DIR/system/priv-app/MateAgent
rm -rf $BASE_DIR/system/priv-app/PeopleStripe
rm -rf $BASE_DIR/system/priv-app/SystemUpdate
rm -rf $BASE_DIR/system/priv-app/PaymentFramework
rm -rf $BASE_DIR/system/priv-app/AuthFramework
rm -rf $BASE_DIR/system/priv-app/BCService
rm -rf $BASE_DIR/system/priv-app/CIDManager
rm -rf $BASE_DIR/system/priv-app/DeviceKeystring
rm -rf $BASE_DIR/system/priv-app/DiagMonAgent91
rm -rf $BASE_DIR/system/priv-app/DigitalKey
rm -rf $BASE_DIR/system/priv-app/FBInstaller_NS
rm -rf $BASE_DIR/system/priv-app/FBServices
rm -rf $BASE_DIR/system/priv-app/FacAtFunction
rm -rf $BASE_DIR/system/priv-app/FactoryTestProvider
rm -rf $BASE_DIR/system/priv-app/FotaAgent
rm -rf $BASE_DIR/system/priv-app/ModemServiceMode
rm -rf $BASE_DIR/system/priv-app/SamsungCarKeyFw
rm -rf $BASE_DIR/system/priv-app/SamsungPass
rm -rf $BASE_DIR/system/priv-app/SmartEpdgTestApp
rm -rf $BASE_DIR/system/priv-app/SOAgent7
rm -rf $BASE_DIR/system/priv-app/SamsungPayStubMini
rm -rf $BASE_DIR/system/priv-app/AppsEdgePanel*
rm -rf $BASE_DIR/system/priv-app/TaskEdgePanel*
rm -rf $BASE_DIR/system/priv-app/Netflix*
rm -rf $BASE_DIR/system/priv-app/OneDrive_Samsung*
rm -rf $BASE_DIR/system/priv-app/YourPhone*

rm -rf $product/app/Chrome
rm -rf $product/app/Gmail2
rm -rf $product/app/Maps
rm -rf $product/app/YouTube
rm -rf $product/app/BardShell

rm -rf $product/priv-app/AndroidAutoStub
rm -rf $product/priv-app/Velvet
rm -rf $product/priv-app/FamilyLinkParentalControls
rm -rf $product/priv-app/SearchSelector
rm -rf $product/priv-app/AiWallpaper

rm -rf $BASE_DIR/system/etc/init/digitalkey_init_nfc_tss2.rc
rm -rf $BASE_DIR/system/etc/init/samsung_pass_authenticator_service.rc
rm -rf $BASE_DIR/system/etc/permissions/privapp-permissions-com.microsoft.skydrive.xml
rm -rf $BASE_DIR/system/etc/permissions/privapp-permissions-com.samsung.android.app.kfa.xml
rm -rf $BASE_DIR/system/etc/permissions/privapp-permissions-com.samsung.android.authfw.xml
rm -rf $BASE_DIR/system/etc/permissions/privapp-permissions-com.samsung.android.carkey.xml
rm -rf $BASE_DIR/system/etc/permissions/privapp-permissions-com.samsung.android.cidmanager.xml
rm -rf $BASE_DIR/system/etc/permissions/privapp-permissions-com.samsung.android.dkey.xml
rm -rf $BASE_DIR/system/etc/permissions/privapp-permissions-com.samsung.android.game.gamehome.xml
rm -rf $BASE_DIR/system/etc/permissions/privapp-permissions-com.samsung.android.providers.factory.xml
rm -rf $BASE_DIR/system/etc/permissions/privapp-permissions-com.samsung.android.samsungpass.xml
rm -rf $BASE_DIR/system/etc/permissions/privapp-permissions-com.samsung.android.spayfw.xml
rm -rf $BASE_DIR/system/etc/permissions/privapp-permissions-com.sec.android.app.factorykeystring.xml
rm -rf $BASE_DIR/system/etc/permissions/privapp-permissions-com.sec.android.diagmonagent.xml
rm -rf $BASE_DIR/system/etc/permissions/privapp-permissions-com.sec.android.soagent.xml
rm -rf $BASE_DIR/system/etc/permissions/privapp-permissions-com.sec.bcservice.xml
rm -rf $BASE_DIR/system/etc/permissions/privapp-permissions-com.sec.epdgtestapp.xml
rm -rf $BASE_DIR/system/etc/permissions/privapp-permissions-com.sec.facatfunction.xml
rm -rf $BASE_DIR/system/etc/permissions/privapp-permissions-com.sem.factoryapp.xml
rm -rf $BASE_DIR/system/etc/permissions/privapp-permissions-com.wssyncmldm.xml
rm -rf $BASE_DIR/system/etc/permissions/privapp-permissions-de.axelspringer.yana.zeropage.xml
rm -rf $BASE_DIR/system/etc/permissions/privapp-permissions-meta.xml
rm -rf $BASE_DIR/system/etc/sysconfig/digitalkey.xml
rm -rf $BASE_DIR/system/etc/sysconfig/meta-hiddenapi-package-allowlist.xml
rm -rf $BASE_DIR/system/etc/sysconfig/preinstalled-packages-com.samsung.android.dkey.xml
rm -rf $BASE_DIR/system/etc/sysconfig/preinstalled-packages-com.samsung.android.spayfw.xml
rm -rf $BASE_DIR/system/etc/sysconfig/samsungauthframework.xml
rm -rf $BASE_DIR/system/etc/sysconfig/samsungpassapp.xml
rm -rf $BASE_DIR/system/lib64/librildump_jni.so

rm -rf $BASE_DIR/system/bin/sdp_cryptod

rm -rf $BASE_DIR/system/bin/fabric_crypto
rm -rf $BASE_DIR/system/etc/init/fabric_crypto.rc
rm -rf $BASE_DIR/system/etc/permissions/FabricCryptoLib.xml
rm -rf $BASE_DIR/system/etc/permissions/privapp-permissions-com.samsung.android.kmxservice.xml
rm -rf $BASE_DIR/system/etc/vintf/manifest/fabric_crypto_manifest.xml
rm -rf $BASE_DIR/system/framework/FabricCryptoLib.jar
rm -rf $BASE_DIR/system/lib64/com.samsung.security.fabric.cryptod-V1-cpp.so
rm -rf $BASE_DIR/system/lib64/vendor.samsung.hardware.security.fkeymaster-V1-cpp.so
rm -rf $BASE_DIR/system/lib64/vendor.samsung.hardware.security.fkeymaster-V1-ndk.so
rm -rf $BASE_DIR/system/priv-app/KmxService

rm -rf $BASE_DIR/system/bin/ssud
rm -rf $BASE_DIR/system/etc/init/ssu_dm1qxxx.rc
rm -rf $BASE_DIR/system/etc/init/ssu.rc
rm -rf $BASE_DIR/system/etc/permissions/privapp-permissions-com.samsung.ssu.xml
rm -rf $BASE_DIR/system/etc/sysconfig/samsungsimunlock.xml
rm -rf $BASE_DIR/system/lib64/android.security.securekeygeneration-ndk.so
rm -rf $BASE_DIR/system/lib64/libssu_keystore2.so
rm -rf $BASE_DIR/system/priv-app/SsuService
rm -rf $BASE_DIR/system/etc/permissions/privapp-permissions-com.samsung.android.app.esimkeystring.xml
rm -rf $BASE_DIR/system/etc/permissions/privapp-permissions-com.samsung.euicc.xml
rm -rf $BASE_DIR/system/etc/sysconfig/preinstalled-packages-com.samsung.android.app.esimkeystring.xml
rm -rf $BASE_DIR/system/etc/sysconfig/preinstalled-packages-com.samsung.euicc.xml
rm -rf $BASE_DIR/system/priv-app/EsimKeyString
rm -rf $BASE_DIR/system/priv-app/EuiccService

# Switch to OpenCamera
rm -rf $BASE_DIR/system/priv-app/SamsungCamera
rsync -ra $SCRIPT_DIR/OpenCamera $BASE_DIR/system/priv-app/

# Switch to AOSP init
rsync -ra $SCRIPT_DIR/bin/ $BASE_DIR/system/bin

# Switch to AOSP lib64
rsync -ra $SCRIPT_DIR/lib64/ $BASE_DIR/system/lib64
