#!/bin/bash

set -ouex pipefail

# Packet Tracer
bash /ctx/ptsetup.sh

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

# Virtual Box:
dnf5 -y install gcc
dnf5 -y install kernel-headers
dnf5 -y install https://download.virtualbox.org/virtualbox/7.2.6/VirtualBox-7.2-7.2.6_172322_fedora40-1.x86_64.rpm

# Misc Software
dnf5 -y install libreoffice
dnf5 -y install putty
dnf5 -y install remmina


echo 'SUBSYSTEMS=="usb", SUBSYSTEM=="block", TAG+="uaccess", MODE="660"' >> /etc/udev/rules.d/00-usb-permissions.rules
rm /usr/share/plymouth/themes/spinner/watermark.png
curl "https://raw.githubusercontent.com/JunePrimavera/testing.lab/refs/heads/main/build_files/sloppy.png" -o /usr/share/plymouth/themes/spinner/watermark.png
