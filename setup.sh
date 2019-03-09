#!/bin/bash

# Set NOPASSWD on group wheel, if itscommented out.
[[ $(sudo grep "#\s%wheel\s\ALL=(ALL)\sNOPASSWD:\sALL" /etc/sudoers) ]] \
  && sudo sed -i \
  's/^#\s*\(%wheel\s\+ALL=(ALL)\s\+NOPASSWD:\s\+ALL\)/\1/' /etc/sudoers 





