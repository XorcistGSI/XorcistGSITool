#!/bin/bash

SCRIPT_DIR=$(dirname "$0")
BASE_DIR=$1

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

rm -rf $product/app/AiasstVision
rm -rf $product/app/AnalyticsCore
rm -rf $product/app/MINextpay
rm -rf $product/app/MIS
rm -rf $product/app/MITSMClient
rm -rf $product/app/MIUIAiasstService
rm -rf $product/app/MIUIFrequentPhrase
rm -rf $product/app/MIUIReporter
rm -rf $product/app/MIUISuperMarket*
rm -rf $product/app/MSA
rm -rf $product/app/MiBugReport*
rm -rf $product/app/MiGameService*
rm -rf $product/app/MiLink*
rm -rf $product/app/PaymentService
rm -rf $product/app/UPTsmService
rm -rf $product/app/Updater
rm -rf $product/app/VoiceAssist*
rm -rf $product/app/VoiceTrigger
rm -rf $product/app/XiaoaiEdgeEngine
rm -rf $product/app/XiaoaiRecommendation
rm -rf $product/app/mi_connect*
rm -rf $product/data-app/BaiduIME
rm -rf $product/data-app/Health
rm -rf $product/data-app/MIGalleryLockscreen*
rm -rf $product/data-app/MiMediaEditor
rm -rf $product/data-app/MIUIDuokanReader
rm -rf $product/data-app/MIUIEmail
rm -rf $product/data-app/MIUIGameCenter
rm -rf $product/data-app/MIUIHuanji
rm -rf $product/data-app/MIUINewHome*
rm -rf $product/data-app/OS2VipAccount
rm -rf $product/data-app/MIUIXiaoAiSpeechEngine
rm -rf $product/data-app/MIUIYoupin
rm -rf $product/data-app/MiShop
rm -rf $product/data-app/MiuiScanner
rm -rf $product/data-app/SmartHome
rm -rf $product/data-app/XMRemoteController
rm -rf $product/data-app/iFlytekIME
rm -rf $product/data-app/wps-lite
rm -rf $product/data-app/MIUIVirtualSim
rm -rf $product/data-app/MIUIMusic*
rm -rf $product/data-app/MIUIVideo
rm -rf $product/data-app/MIpay
rm -rf $product/data-app/MiMediaEditor
rm -rf $product/data-app/MiRadio
rm -rf $product/priv-app/MIService
rm -rf $product/priv-app/MIShare
rm -rf $product/priv-app/MIUIAICR
rm -rf $product/priv-app/MIUIBrowser
rm -rf $product/priv-app/MIUIMusic*
rm -rf $product/priv-app/MIUIContentExtension
rm -rf $product/priv-app/MiGameCenterSDKService
rm -rf $product/priv-app/MIUIMirror
rm -rf $product/priv-app/MIUIPersonalAssistant*
rm -rf $product/priv-app/MIUIQuickSearchBox
rm -rf $product/priv-app/MIUIVideo
rm -rf $product/priv-app/MIUIYellowPage
rm -rf $product/priv-app/MiuiExtraPhoto
rm -rf $system_ext/app/MiuiDaemon

# Switch to AOSP SetupWizard
rm -rf $system_ext/priv-app/Provision
rsync -ra $SCRIPT_DIR/SetupWizard $BASE_DIR/system/priv-app/

# Remove init.recovery.hardware
rm -rf $BASE_DIR/init.recovery.hardware.rc

# Switch to OpenCamera
rm -rf $product/priv-app/MiuiCamera
rsync -ra $SCRIPT_DIR/OpenCamera $product/priv-app/

# Switch to AOSP init
rsync -ra $SCRIPT_DIR/bin/ $BASE_DIR/system/bin/

# Lag Fix
echo "ro.surface_flinger.use_content_detection_for_refresh_rate=true" >> $BASE_DIR/system/build.prop
echo "ro.surface_flinger.set_idle_timer_ms=2147483647" >> $BASE_DIR/system/build.prop
echo "ro.surface_flinger.set_touch_timer_ms=2147483647" >> $BASE_DIR/system/build.prop
echo "ro.surface_flinger.set_display_power_timer_ms=2147483647" >> $BASE_DIR/system/build.prop
# Lag Fix - Disable CoreSight
echo "persist.debug.coresight.config=" >> $BASE_DIR/system/build.prop
# Lag Fix - Misc ART optimizations
echo "dalvik.vm.foreground-heap-growth-multiplier=2.5" >> $BASE_DIR/system/build.prop
echo "dalvik.vm.heapgrowthlimit=512m" >> $BASE_DIR/system/build.prop
echo "dalvik.vm.heapmaxfree=32m" >> $BASE_DIR/system/build.prop
echo "dalvik.vm.heapminfree=512k" >> $BASE_DIR/system/build.prop
echo "dalvik.vm.heapsize=512m" >> $BASE_DIR/system/build.prop
echo "dalvik.vm.heapstartsize=2m" >> $BASE_DIR/system/build.prop
echo "dalvik.vm.heapstartsize=2m" >> $BASE_DIR/system/build.prop
echo "dalvik.vm.heaptargetutilization=0.8" >> $BASE_DIR/system/build.prop
echo "dalvik.vm.dex2oat-minidebuginfo=false" >> $BASE_DIR/system/build.prop
echo "dalvik.vm.minidebuginfo=false" >> $BASE_DIR/system/build.prop
echo "persist.device_config.runtime_native.usap_pool_enabled=true" >> $BASE_DIR/system/build.prop
echo "dalvik.vm.usap_pool_enabled=true" >> $BASE_DIR/system/build.prop
echo "dalvik.vm.usap_pool_size_max=3" >> $BASE_DIR/system/build.prop
echo "dalvik.vm.usap_pool_size_min=1" >> $BASE_DIR/system/build.prop
echo "dalvik.vm.usap_refill_threshold=1" >> $BASE_DIR/system/build.prop
# Lag Fix - Debug
echo "persist.sys.debug.app.mtbf_test=false" >> $BASE_DIR/system/build.prop
echo "persist.sys.perfdebug.monitor.enable=false" >> $BASE_DIR/system/build.prop
# Lag Fix - Network
echo "persist.sys.miuitcptracker.ctrl=false" >> $BASE_DIR/system/build.prop
echo "vendor.miui.wifi.p2p.enable160m=true" >> $BASE_DIR/system/build.prop
# Lag Fix - High Precision Positioning
echo "persist.vendor.gnss.hpLocSetUI=true" >> $BASE_DIR/system/build.prop
# Lag Fix - Faster game loading
echo "debug.game.video.support=true" >> $BASE_DIR/system/build.prop
# Lag Fix - AppCompact
echo "persist.sys.use_boot_compact=false" >> $BASE_DIR/system/build.prop
# Lag Fix - Framepacing
echo "vendor.perf.framepacing.enable=false" >> $BASE_DIR/system/build.prop
# Lag Fix - Display
echo "persist.sys.smartpower.display_camera_fps_enable=false" >> $BASE_DIR/system/build.prop
echo "ro.vendor.touch.touchscheduler.enable=false" >> $BASE_DIR/system/build.prop
# Lag Fix - Prefetchers
echo "persist.mm.enable.prefetch=false" >> $BASE_DIR/system/build.prop
echo "persist.sys.dynamic_usap_enabled=false" >> $BASE_DIR/system/build.prop
echo "persist.sys.preload.enable=false" >> $BASE_DIR/system/build.prop
echo "persist.sys.prestart.feedback.enable=false" >> $BASE_DIR/system/build.prop
echo "persist.sys.prestart.proc=false" >> $BASE_DIR/system/build.prop
echo "persist.sys.stability.iorapEnable=false" >> $BASE_DIR/system/build.prop
# Lag Fix - Misc
echo "persist.sys.fboservice.ctrl=true" >> $BASE_DIR/system/build.prop
echo "persist.sys.stability.fbo_hal_stop=false" >> $BASE_DIR/system/build.prop
echo "persist.sys.support_ultra_hdr=true" >> $BASE_DIR/system/build.prop

# Remove mi_ext partition
if [ -d "$BASE_DIR/mi_ext/" ]; then
    if [ -f "$BASE_DIR/mi_ext/etc/build.prop" ]; then
        cat "$BASE_DIR/mi_ext/etc/build.prop" >> "$BASE_DIR/system/build.prop"
    fi
    if [ -d "$BASE_DIR/mi_ext/product/" ]; then
        rsync -ra "$BASE_DIR/mi_ext/product/" "$product/"
    fi
    if [ -d "$BASE_DIR/mi_ext/system_ext/" ]; then
        rsync -ra "$BASE_DIR/mi_ext/system_ext/" "$system_ext/"
    fi
    if [ -d "$BASE_DIR/mi_ext/system/" ]; then
        rsync -ra "$BASE_DIR/mi_ext/system/" "$BASE_DIR/system/"
    fi
    rm -rf "$BASE_DIR/mi_ext/"
fi
