#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate
# Thay đổi tên Model hiển thị
sed -i 's/Xiaomi Mi Router AX3000T/NR3053 Custom HT/g' target/linux/mediatek/dts/mt7981-xiaomi-mi-router-ax3000t.dts

# Ép tích hợp Driver Wifi MT7981 vào bản build
echo "CONFIG_PACKAGE_kmod-mt7981=y" >> .config
echo "CONFIG_PACKAGE_kmod-mt798x-common=y" >> .config
echo "CONFIG_PACKAGE_wpad-basic-mbedtls=y" >> .config
