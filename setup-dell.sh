#!/bin/bash
#
# NOTE: $0 must be run twice
#
# setup.sh needs to be run twice on first run
#

RPMFUSION=/etc/yum.repos.d/rpmfusion-free.repo 
VSCODE=/etc/yum.repos.d/vscode.repo 

[[ $(id -u) != 0 ]] && echo "Must be run as root. Exiting..." && exit 3

[[ $1 == "--rollback" || $1 == "-r" ]] && \
	rpm-ostree rollback && \
	systemctl reboot && \
	exit 0

#[[ -f $VSCODE && -f $RPMFUSION ]]  && \
  rpm-ostree install kmod-wl --reboot


