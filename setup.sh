#!/bin/bash

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


rpm-ostree install cinnamon clang cmake facter guestfs-browser htop iotop make libguestfs-tools libvirt-daemon-config-network libvirt-daemon-kvm python python-libguestfs qemu-kvm rpmdevtools ruby strace tmux vim virt-install virt-manager virt-viewer virt-top --reboot

#rpm-ostree install \
#        cinnamon \
#        cmake \
#        facter \
#        guestfs-browser \ 
#        #htop \
#        #iotop \
#        make \ 
#        libvirt-daemon-config-network \
#        libvirt-daemon-kvm \
#        python python-libguestfs \
#        qemu-kvm \
#        ruby \
#        strace \
#        vim \
#        virt-install \
#        virt-manager \
#        virt-viewer \
#        virt-top \
#        libguestfs-tools \
#  	--reboot

systemctl enable sshd
systemctl start sshd
