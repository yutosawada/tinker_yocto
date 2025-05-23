SUMMARY = "Custom configuration for systemd-networkd-wait-online"
DESCRIPTION = "Override configuration for systemd-networkd-wait-online to reduce timeout to 5 seconds"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://wait-online.conf"

S = "${WORKDIR}"

RDEPENDS:${PN} = "systemd"

do_install() {
    install -d ${D}${systemd_system_unitdir}/systemd-networkd-wait-online.service.d
    install -m 0644 ${WORKDIR}/wait-online.conf ${D}${systemd_system_unitdir}/systemd-networkd-wait-online.service.d/
}

FILES:${PN} = "${systemd_system_unitdir}/systemd-networkd-wait-online.service.d/wait-online.conf"

COMPATIBLE_MACHINE = "(.*)"