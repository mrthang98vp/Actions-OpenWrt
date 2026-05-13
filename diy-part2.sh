#!/bin/bash

# 1. Định danh thiết bị (Sửa tên Model & Hostname)
# Sửa tên hiển thị trong trang Overview
sed -i 's/Xiaomi Mi Router AX3000T/NR3053 Custom HTWrt/g' target/linux/mediatek/dts/mt7981-xiaomi-mi-router-ax3000t.dts
# Sửa tên thiết bị trong hệ thống
sed -i 's/ImmortalWrt/HTWRT/g' package/base-files/files/bin/config_generate
sed -i 's/Xiaomi Mi Router AX3000T/NR3053 Custom HTWrt/g' package/base-files/files/bin/config_generate

# 2. Tối ưu bộ nhớ & RAM (Cho NR3053 256MB ROM / 512MB RAM)
echo "CONFIG_TARGET_ROOTFS_PARTSIZE=220" >> .config
echo "CONFIG_PACKAGE_zram-swap=y" >> .config
echo "CONFIG_KERNEL_SWAP=y" >> .config

# 3. ÉP CÀI DRIVER WIFI (Full bộ cho chip MT7981)
echo "CONFIG_PACKAGE_kmod-mt7981-firmware=y" >> .config
echo "CONFIG_PACKAGE_kmod-mt79x1-common=y" >> .config
echo "CONFIG_PACKAGE_kmod-mt7981-common=y" >> .config
echo "CONFIG_PACKAGE_kmod-mt7981-wifi=y" >> .config
echo "CONFIG_PACKAGE_wpad-mesh-openssl=y" >> .config

# 4. Tự động bật Wifi ngay khi khởi động
sed -i 's/disabled=1/disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 5. Giao diện & Tính năng (Tiếng Việt, Argon, TurboAcc, AdGuard)
echo "CONFIG_PACKAGE_luci-i18n-base-vi=y" >> .config
echo "CONFIG_PACKAGE_luci-theme-argon=y" >> .config
echo "CONFIG_PACKAGE_luci-app-argon-config=y" >> .config
echo "CONFIG_PACKAGE_luci-app-turboacc=y" >> .config
echo "CONFIG_PACKAGE_luci-app-adguardhome=y" >> .config
echo "CONFIG_PACKAGE_luci-app-filebrowser=y" >> .config
echo "CONFIG_PACKAGE_luci-app-statistics=y" >> .config
