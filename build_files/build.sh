#!/bin/bash

set -ouex pipefail

# Packet Tracer
#bash /ctx/ptsetup.sh

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/stagingqt5

# Packet Tracer Dependancies
dnf5 -y install qt5-qtnetworkauth
dnf5 -y install qt5-qtscript
dnf5 -y install qt5-qtmultimedia
dnf5 -y install qt5-qtwebsockets
dnf5 -y install qt5-qtwebengine

#Packet Tracer Installation 
curl "https://www.netacad.com/authoring-resources/courses/ff9e491c-49be-4734-803e-a79e6e83dab1/c3636211-1ce6-4f92-8a22-ccddf902dd72/en-US/assets/PacketTracer822_amd64_signed_en-US_35234a27-3127-49bc-91ce-2926af76f07a.deb" -o pt.deb
ar -x pt.deb
tar -xf data.tar.xz
cp opt/pt/bin/PacketTracer /usr/lib/
echo """
[Desktop Entry]
Type=Application
Name=Cisco Packet Tracer
Exec=/usr/lib/PacketTracer
StartupNotify=false
Terminal=false
""" >> /usr/share/applications/PacketTracer.desktop

# Virtual Box:
dnf5 -y install gcc
dnf5 -y install kernel-headers
dnf5 -y install https://download.virtualbox.org/virtualbox/7.2.6/VirtualBox-7.2-7.2.6_172322_fedora40-1.x86_64.rpm

# Misc Software
dnf5 -y install libreoffice
dnf5 -y install putty
dnf5 -y install remmina


echo 'SUBSYSTEMS=="usb", SUBSYSTEM=="block", TAG+="uaccess", MODE="660"' >> /etc/udev/rules.d/00-usb-permissions.rules
