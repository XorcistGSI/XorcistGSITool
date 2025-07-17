# Vendor overlays
mount -o bind /system/foxetgsi/vo /vendor/overlay || true
mount -o bind /system/foxetgsi/group /vendor/etc/group || true
mount -o bind /system/foxetgsi/passwd /vendor/etc/passwd || true
