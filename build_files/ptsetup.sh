#!/bin/bash

set -euo pipefail
curl "https://www.netacad.com/authoring-resources/courses/ff9e491c-49be-4734-803e-a79e6e83dab1/c3636211-1ce6-4f92-8a22-ccddf902dd72/en-US/assets/PacketTracer822_amd64_signed_en-US_35234a27-3127-49bc-91ce-2926af76f07a.deb" -o pt.deb

selected_installer="pt.deb"
sudo dnf -y install binutils fuse fuse-libs qt5-qttools
mkdir packettracer
ar -x $selected_installer --output=packettracer
tar -xvf packettracer/control.tar.xz --directory=packettracer
tar -xvf packettracer/data.tar.xz --directory=packettracer 
sudo cp -r packettracer/* /var/
! test -d /var/usr/local/bin && sudo mkdir -p /var/usr/local/bin
sudo ln -sf /var/opt/pt/packettracer.AppImage /var/usr/local/bin/packettracer
/var/opt/pt/packettracer --pt-activate
sudo ./packettracer/postinst
sudo xdg-desktop-menu uninstall /var/usr/share/applications/cisco-pt*.desktop
sudo update-mime-database /var/usr/share/mime
sudo gtk-update-icon-cache -t --force /var/usr/share/icons
sudo rm -rf packettracer
