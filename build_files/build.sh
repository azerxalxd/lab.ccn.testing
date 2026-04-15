#!/bin/bash

set -ouex pipefail

# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1


# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging
dnf5 -y install https://download.virtualbox.org/virtualbox/7.2.6/VirtualBox-7.2-7.2.6_172322_fedora40-1.x86_64.rpm
dnf5 -y install libreoffice
dnf5 -y install putty
dnf5 -y install remmina

echo 'SUBSYSTEMS=="usb", SUBSYSTEM=="block", TAG+="uaccess", MODE="660"' >> /etc/udev/rules.d/00-usb-permissions.rules
#### Example for enabling a System Unit File

#systemctl enable podman.socket
