#!/bin/sh
echo "Downloading files..."
curl https://codeload.github.com/NorcuxOS/build-scripts-rolling/tar.gz/Alpha_0.8 --output Alpha_0.8.tar.gz

echo "Unpacking files..."
tar -xf Alpha_0.8.tar.gz --one-top-level=Alpha_0.8 --strip 1

echo "Installing..."
cd Alpha_0.8/live-iso/

pacman -Syu --noconfirm

cp "airootfs/etc/skel/.config/ksmserverrc" "/etc/skel/.config/ksmserverrc"
for homedir in /home/*; do cp "airootfs/etc/skel/.config/ksmserverrc" "$homedir/.config/ksmserverrc"; done

cp "pacman.conf" "/etc/pacman.conf"

pacman -Rsn --noconfirm dhclient

systemctl disable systemd-timesyncd

cp "airootfs/etc/skel/.config/klaunchrc" "/etc/skel/.config/klaunchrc"
for homedir in /home/*; do cp "airootfs/etc/skel/.config/klaunchrc" "$homedir/.config/klaunchrc"; done

cp "airootfs/etc/skel/.local/share/applications/vim.desktop" "/etc/skel/.local/share/applications/vim.desktop"
for homedir in /home/*; do cp "airootfs/etc/skel/.local/share/applications/vim.desktop" "$homedir/.local/share/applications/vim.desktop"; done

pacman -S sddm --overwrite "/usr/share/sddm/*"

pacman -Rsn --noconfirm norcuxos-plasma-look-and-feel
pacman -S --noconfirm norcuxos-plasma-theme

pacman -S --noconfirm norcuxos-artwork
rm -rf /usr/share/wallpapers/NorcuxOS_Background.png /usr/share/about-distro/distribution-logo*
cp "airootfs/etc/xdg/kcm-about-distrorc" "/etc/xdg/kcm-about-distrorc"

cp "airootfs/etc/skel/.config/kscreenlockerrc" "/etc/skel/.config/kscreenlockerrc"
for homedir in /home/*; do cp "airootfs/etc/skel/.config/kscreenlockerrc" "$homedir/.config/kscreenlockerrc"; done

cp "airootfs/etc/skel/.config/konsolerc" "/etc/skel/.config/konsolerc"
for homedir in /home/*; do cp "airootfs/etc/skel/.config/konsolerc" "$homedir/.config/konsolerc"; done
cp "airootfs/etc/skel/.local/share/konsole/NorcuxOS.colorscheme" "/etc/skel/.local/share/konsole/NorcuxOS.colorscheme"
for homedir in /home/*; do cp "airootfs/etc/skel/.local/share/konsole/NorcuxOS.colorscheme" "$homedir/.local/share/konsole/NorcuxOS.colorscheme"; done
cp "airootfs/etc/skel/.local/share/konsole/NorcuxOS.profile" "/etc/skel/.local/share/konsole/NorcuxOS.profile"
for homedir in /home/*; do cp "airootfs/etc/skel/.local/share/konsole/NorcuxOS.profile" "$homedir/.local/share/konsole/NorcuxOS.profile"; done

echo "Done!"
