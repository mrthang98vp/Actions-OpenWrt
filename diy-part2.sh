#!/bin/bash
# 1. Sửa định danh thiết bị (Đúng target Xiaomi AX3000T)
sed -i 's/Xiaomi Mi Router AX3000T/NR3053 Custom/g' target/linux/mediatek/dts/mt7981-xiaomi-mi-router-ax3000t.dts
sed -i 's/ImmortalWrt/NR3053/g' package/base-files/files/bin/config_generate
sed -i 's/Xiaomi Mi Router AX3000T/NR3053 Custom/g' package/base-files/files/bin/config_generate
# 2. ÉP CÀI DRIVER WIFI (Full bộ cho chip MT7981)
echo "CONFIG_PACKAGE_kmod-mt7981-firmware=y" >> .config
echo "CONFIG_PACKAGE_kmod-mt79x1-common=y" >> .config
echo "CONFIG_PACKAGE_kmod-mt7981-common=y" >> .config
echo "CONFIG_PACKAGE_kmod-mt7981-wifi=y" >> .config
echo "CONFIG_PACKAGE_wpad-mesh-openssl=y" >> .config
# 3. Tự động bật Wifi ngay khi khởi động
sed -i 's/disabled=1/disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
# 4. Giao diện & Tính năng
echo "CONFIG_PACKAGE_luci-app-statistics=y" >> .config
