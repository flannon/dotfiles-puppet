#!/bin/bash

# setup.sh needs to be run twice on first run
#

[[ $(id -u) != 0 ]] && echo "Must be run as root. Exiting..." && exit 3

[[ $1 == "--rollback" || $1 == "-r" ]] && \
	rpm-ostree rollback && \
	systemctl reboot && \
	exit 0

# Talk to myself - configure sshd for localhost connectivity
sed -i 's/^#ListenAddress 0.0.0.0/ListenAddress 127.0.0.1/' /etc/ssh/sshd_config
sed -i 's/^#ListenAddress ::/ListenAddress ::1/' /etc/ssh/sshd_config
sed -i 's/^PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Set NOPASSWD on group wheel, if it's commented out.
[[ $(sudo grep "#\s%wheel\s\ALL=(ALL)\sNOPASSWD:\sALL" /etc/sudoers) ]] && \
  	sudo sed -i \
  	's/^#\s*\(%wheel\s\+ALL=(ALL)\s\+NOPASSWD:\s\+ALL\)/\1/' /etc/sudoers 

[[ ! -f /etc/yum.repos.d/rpmfusion-free.repo ]]  && \
	rpm-ostree  install \
	https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
	https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm && \
	systemctl reboot

#[[ ! -f /etc/yum.repos.d/vscode.repo ]]  && \
#	sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
#  	systemctl reboot

rpm-ostree install cinnamon compat-ffmpeg28 

#rpm-ostree install cinnamon compat-ffmpeg28 guestfs-browser libguestfs-tools libvirt-daemon-config-network libvirt-daemon-kvm python python-libguestfs qemu-kvm rpmdevtools ruby virt-install virt-manager virt-viewer virt-top --reboot

#rpm-ostree install cinnamon compat-ffmpeg28 guestfs-browser libguestfs-tools libvirt-daemon-config-network libvirt-daemon-kvm python python-libguestfs qemu-kvm rpmdevtools ruby strace tmux vim virt-install virt-manager virt-viewer virt-top --reboot

 
#rpm-ostree install cinnamon clang cmake compat-ffmpeg28 facter guestfs-browser htop iotop make libguestfs-tools libvirt-daemon-config-network libvirt-daemon-kvm python python-libguestfs qemu-kvm rpmdevtools ruby strace tmux vim virt-install virt-manager virt-viewer virt-top --reboot

systemctl enable sshd
systemctl start sshd
