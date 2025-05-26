FILESEXTRAPATHS:prepend := "${THISDIR}/linux-rockchip:"
SRC_URI:append = " file://hid_gamepad.cfg "
# すでに追加済みの hid-playstation パッチもここに並べる
