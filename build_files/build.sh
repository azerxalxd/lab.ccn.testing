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

# Packet Tracer
wget https://www.netacad.com/authoring-resources/courses/ff9e491c-49be-4734-803e-a79e6e83dab1/c3636211-1ce6-4f92-8a22-ccddf902dd72/en-US/assets/PacketTracer822_amd64_signed_en-US_35234a27-3127-49bc-91ce-2926af76f07a.deb -o /tmp/pt.deb
bash /ctx/ptsetup.sh

echo 'SUBSYSTEMS=="usb", SUBSYSTEM=="block", TAG+="uaccess", MODE="660"' >> /etc/udev/rules.d/00-usb-permissions.rules
rm /usr/share/plymouth/themes/spinner/watermark.png
wget https://raw.githubusercontent.com/JunePrimavera/testing.lab/refs/heads/main/build_files/sloppy.png -o /usr/share/plymouth/themes/spinner/watermark.png
#### Example for enabling a System Unit File

#systemctl enable podman.socket
