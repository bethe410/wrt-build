#!/bin/bash
# patch source files

# 16m flash
sed -i '/define Device\/tplink_tl-wr740n-v5/,/endef/{s/  \$(Device\/tplink-4mlzma)/  $(Device\/tplink-16mlzma)/}' target/linux/ath79/image/tiny-tp-link.mk
sed -i '/firmware: partition@20000 {/,/};/s/reg = <0x20000 0x3d0000>;/reg = <0x20000 0xfd0000>;/' target/linux/ath79/dts/ar9331_tplink_tl-wr741nd-v4.dtsi
sed -i '/art: partition@3f0000 {/,/};/s/art: partition@3f0000/art: partition@ff0000/; /art: partition@ff0000 {/,/};/s/reg = <0x3f0000/reg = <0xff0000/' target/linux/ath79/dts/ar9331_tplink_tl-wr741nd-v4.dtsi

# fix-leds and switch-phy-addr-swap for china hardware model v5.3
sed -i '/switch-phy-addr-swap\|switch-phy-swap/s/<1>/<0>/g' target/linux/ath79/dts/ar9331_tplink_tl-wr741nd-v4.dtsi
sed -i '/lan4 {/,/};/s/gpios = <&gpio 17 GPIO_ACTIVE_LOW>;/gpios = <\&gpio 13 GPIO_ACTIVE_HIGH>;/' target/linux/ath79/dts/ar9331_tplink_tl-wr741nd-v4.dtsi
sed -i '/wan {/,/};/s/gpios = <&gpio 13 GPIO_ACTIVE_HIGH>;/gpios = <\&gpio 17 GPIO_ACTIVE_LOW>;/' target/linux/ath79/dts/ar9331_tplink_tl-wr741nd-v4.dtsi
