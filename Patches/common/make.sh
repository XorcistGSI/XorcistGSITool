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

rsync -ra "$SCRIPT_DIR/system/" "$BASE_DIR/system/"
rsync -ra "$SCRIPT_DIR/system_ext/" "$system_ext/"

sed -i "/ro.secure/d" $BASE_DIR/system/build.prop
sed -i "/ro.adb.secure/d" $BASE_DIR/system/build.prop
sed -i "/ro.debuggable/d" $BASE_DIR/system/build.prop
sed -i "/ro.force.debuggable/d" $BASE_DIR/system/build.prop
sed -i "/media.settings.xml/d" $BASE_DIR/system/build.prop
sed -i "/ro.arch/d" $BASE_DIR/system/build.prop
sed -i "/persist.sys.usb.config/d" $BASE_DIR/system/build.prop
sed -i "/ro.actionable_compatible_property.enabled/d" $BASE_DIR/system/build.prop
sed -i "/ro.product.ab_ota_partitions/d" $product/etc/build.prop

cat $SCRIPT_DIR/system_build.prop >> $BASE_DIR/system/build.prop
cat $SCRIPT_DIR/product_build.prop >> $product/etc/build.prop
cat $SCRIPT_DIR/file_contexts >> $BASE_DIR/system/etc/selinux/plat_file_contexts

rm -rf $BASE_DIR/system/lib64/libdolphin.so
rm -rf $system_ext/lib64/libdolphin.so

rm -rf $BASE_DIR/system/etc/permissions/qti_permissions.xml
rm -rf $BASE_DIR/system/etc/permissions/com.qti.dpmframework.xml
rm -rf $system_ext/etc/permissions/qti_permissions.xml
rm -rf $system_ext/etc/permissions/com.qti.dpmframework.xml

rm -rf $BASE_DIR/system/priv-app/DiracAudioControlService
rm -rf $BASE_DIR/system/app/DiracManager

rm -rf $BASE_DIR/system/priv-app/com.qualcomm.location

$SCRIPT_DIR/../../Tools/sepolicy/sepolicy_prop_remover.sh $BASE_DIR/system/etc/selinux/plat_property_contexts "device/qcom/sepolicy" > $BASE_DIR/system/../../plat_property_contexts
mv $BASE_DIR/system/../../plat_property_contexts $BASE_DIR/system/etc/selinux/plat_property_contexts
sed -i "/typetransition location_app/d" $BASE_DIR/system/etc/selinux/plat_sepolicy.cil

sed -i "/reboot_on_failure/d" $BASE_DIR/system/etc/init/hw/init.rc
sed -i "/reboot_on_failure/d" $BASE_DIR/system/etc/init/apexd.rc
sed -i "/reserved_disk/d" $BASE_DIR/system/etc/init/vold.rc

plat_property=$BASE_DIR/system/etc/selinux/plat_property_contexts
sed -i "/persist.vendor.camera/d" $plat_property
sed -i "/ro.vendor.camera/d" $plat_property
sed -i "/vendor.camera/d" $plat_property
sed -i "/sys.usb.config/d" $plat_property
sed -i "/sys.usb.configfs/d" $plat_property
sed -i "/sys.usb.controller/d" $plat_property
sed -i "/ro.actionable_compatible_property.enabled/d" $plat_property
sed -i "/ro.build.fingerprint/d" $plat_property
sed -i "/ro.opengles.version/d" $plat_property
sed -i "/ro.product.ab_ota_partitions/d" $plat_property
sed -i "/ro.vendor.build.ab_ota_partitions/d" $plat_property

system_ext_plat_property=$system_ext/etc/selinux/system_ext_property_contexts
sed -i "/persist.vendor.camera/d" $system_ext_plat_property
sed -i "/ro.vendor.camera/d" $system_ext_plat_property
sed -i "/vendor.camera/d" $system_ext_plat_property

sed -i "/persist.vendor.camera/d" $system_ext/etc/selinux/system_ext_sepolicy.cil
sed -i "/ro.vendor.camera/d" $system_ext/etc/selinux/system_ext_sepolicy.cil
sed -i "/vendor.camera/d" $system_ext/etc/selinux/system_ext_sepolicy.cil
sed -i "/genfscon/d" $system_ext/etc/selinux/system_ext_sepolicy.cil

rm -rf $system_ext/etc/selinux/mapping/*
rm -rf $product/etc/selinux/mapping/*

rm -rf $BASE_DIR/system/bin/update_engine
rm -rf $BASE_DIR/system/bin/update_verifier
rm -rf $BASE_DIR/system/etc/init/recovery-persist.rc
rm -rf $BASE_DIR/system/etc/init/recovery-refresh.rc
rm -rf $BASE_DIR/system/etc/init/update_engine.rc
rm -rf $BASE_DIR/system/etc/init/update_verifier.rc
rm -rf $BASE_DIR/system/etc/init/cppreopts.rc
rm -rf $BASE_DIR/system/etc/init/otapreopt.rc

rm -rf $system_ext/apex/com.android.vndk.v*
mv $system_ext/apex/* $BASE_DIR/system/apex
rm -rf $system_ext/apex

find "$BASE_DIR" -type d \( -name "app" -o -name "priv-app" \) | while read -r dir; do
    find "$dir" -type d -name "oat" -exec rm -rf {} + 2>/dev/null
    find "$dir" -type f -name "*.prof" -exec rm -f {} + 2>/dev/null
done

find "$BASE_DIR" -type f -name "fstab.*" -exec rm -f {} + 2>/dev/null
