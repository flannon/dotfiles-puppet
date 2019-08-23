#!/bin/bash

INSTALLDIR="${HOME}/.dotfiles"

stat_container () {
	container=$1
	toolbox list --containers | awk '{ print $2 }' |  \
	  grep -v ID |  grep -v created | grep ${container} \
	  2>&1 1> /dev/null
}

#c="control"
#stat_container $c
#[[ $? != 0 ]] && toolbox create --container $c
#toolbox run --container $c bash -c "cd ${INSTALLDIR}/ansible && \
#	ansible-galaxy install -r requirements.yml"
#toolbox run --container $c bash -c "cd ${INSTALLDIR}/ansible && \
#	ansible-playbook -e user=${USER} -i ./inventory playbooks/control.yml"

c=$USER
echo $c
stat_container $c
[[ $? != 0 ]] && toolbox create --container $c 
toolbox run --container $c bash -c "sudo dnf install -y ansible"
toolbox run --container $c bash -c "cd ${INSTALLDIR}/ansible && \
	ansible-playbook -vvvv -e user=${USER} -i ./inventory playbooks/user.yml"


#
##[[ $CONTAINERSTATE == "true" ]]  && podman exec -i $c dnf install ansible
	

