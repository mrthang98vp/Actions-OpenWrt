#!/bin/bash

# 1. Định danh thiết bị & Phiên bản (Cá nhân hóa)
# Đổi tên Model hiển thị chính xác cho NR3053
sed -i 's/Xiaomi Mi Router AX3000T/NR3053 Custom HTWrt/g' target/linux/mediatek/dts/mt7981-xiaomi-mi-router-ax3000t.dts

# Đổi Hostname (Tên thiết bị xuất hiện trong mạng LAN)
sed -i 's/ImmortalWrt/HTWRT/g' package/base-files/files/bin/config_generate

# Đổi số phiên bản Firmware (Hiển thị ở trang chính)
echo "1.52026-HTWrt mod" > package/base-files/files/etc/openwrt_version

# 2. Tối ưu hóa hệ thống & Lưu trữ
# Tăng dung lượng phân vùng cài đặt lên 220MB (Cho ROM 256MB cực kỳ thoải mái)
echo "CONFIG_TARGET_ROOTFS_PARTSIZE=220" >> .config

# Tối ưu hóa RAM 512MB (ZRAM giúp chạy nhiều app mượt hơn)
echo "CONFIG_PACKAGE_zram-swap=y" >> .config
echo "CONFIG_KERNEL_SWAP=y" >> .config

# Tự động bật Wi-Fi ngay khi flash xong (Mặc định OpenWrt sẽ tắt)
sed -i 's/disabled=1/disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 3. Ép tích hợp Driver Wi-Fi & Giao diện Argon (Giao diện đẹp nhất)
# Driver Wi-Fi chip MT7981
echo "CONFIG_PACKAGE_kmod-mt7981=y" >> .config
echo "CONFIG_PACKAGE_kmod-mt798x-common=y" >> .config
echo "CONFIG_PACKAGE_wpad-basic-mbedtls=y" >> .config

# Chuyển mặc định sang giao diện Argon (Có Dark Mode, đổi hình nền)
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
echo "CONFIG_PACKAGE_luci-theme-argon=y" >> .config
echo "CONFIG_PACKAGE_luci-app-argon-config=y" >> .config

# Thêm gói ngôn ngữ Tiếng Việt
echo "CONFIG_PACKAGE_luci-i18n-base-vi=y" >> .config

# 4. Các tính năng "Ăn chơi" tích hợp sẵn
# Tăng tốc độ mạng TurboAcc (Shortcut-FE)
echo "CONFIG_PACKAGE_luci-app-turboacc=y" >> .config
# Chặn quảng cáo AdGuard Home
echo "CONFIG_PACKAGE_luci-app-adguardhome=y" >> .config
# Quản lý file (File Browser) và Xem thống kê hệ thống
echo "CONFIG_PACKAGE_luci-app-filebrowser=y" >> .config
echo "CONFIG_PACKAGE_luci-app-statistics=y" >> .config
