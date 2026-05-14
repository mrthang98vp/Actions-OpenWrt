#!/bin/bash
# 2. ÉP CÀI DRIVER WIFI (Full bộ cho chip MT7981)
echo "CONFIG_PACKAGE_kmod-mt7981-firmware=y" >> .config
echo "CONFIG_PACKAGE_kmod-mt79x1-common=y" >> .config
echo "CONFIG_PACKAGE_kmod-mt7981-common=y" >> .config
echo "CONFIG_PACKAGE_kmod-mt7981-wifi=y" >> .config
echo "CONFIG_PACKAGE_wpad-mesh-openssl=y" >> .config
# Bật Wi-Fi mặc định (Mặc định OpenWrt sẽ tắt Wi-Fi, dòng này sẽ chuyển disabled từ 1 sang 0)
sed -i 's/disabled=1/disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
# Cấu hình IP mặc định là 192.168.1.1
sed -i 's/192.168.1.1/192.168.1.1/g' package/base-files/files/bin/config_generate
