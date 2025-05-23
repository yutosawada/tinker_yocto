SUMMARY = "bitbake-layers recipe"
DESCRIPTION = "Recipe created by bitbake-layers"
LICENSE = "MIT"

ROOTFS_POSTPROCESS_COMMAND += "configure_sshd_settings;"

configure_sshd_settings() {
    # PasswordAuthenticationを有効にする
    sed -i 's/^#PasswordAuthentication.*/PasswordAuthentication yes/' ${IMAGE_ROOTFS}/etc/ssh/sshd_config
    sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' ${IMAGE_ROOTFS}/etc/ssh/sshd_config

    # PermitRootLoginを有効にする
    sed -i 's/^#PermitRootLogin.*/PermitRootLogin yes/' ${IMAGE_ROOTFS}/etc/ssh/sshd_config
    sed -i 's/^PermitRootLogin prohibit-password/PermitRootLogin yes/' ${IMAGE_ROOTFS}/etc/ssh/sshd_config
}

addtask display_banner before do_build
