#!/bin/bash

PATH=$PATH:${HOME}/.local/bin
INSTALLDIR="${HOME}/.dotfiles"

# Set up authorized_keys for $USER
grep "${USER}ss\@" ~/.ssh/id_rsa.pub 2>&1 1>/dev/null
[[ -f ${HOME}/.ssh/id_rsa.pub && $? != 0 ]] && cat ${HOME}/.ssh/id_rsa.pub >> ${HOME}/.ssh/authorized_keys
[[ -f ${HOME}/.ssh/authorized_keys ]] && chmod 644 ${HOME}/.ssh/authorized_keys

stat_container () {
	container=$1
	toolbox list --containers | awk '{ print $2 }' |  \
	  grep -v ID |  grep -v created | grep ${container} \
	  2>&1 1> /dev/null
}

c=$USER
echo $c
stat_container $c
[[ $? != 0 ]] && toolbox create --container $c 
toolbox run --container $c bash -c "python3 -m pip install ansible --user"
#toolbox run --container $c bash -c "sudo dnf install -y ansible"
toolbox run --container $c bash -c "cd ${INSTALLDIR}/ansible && \
	${HOME}/.local/bin/ansible-galaxy install -r requirements.yml"
toolbox run --container $c bash -c "cd ${INSTALLDIR}/ansible && \
	${HOME}/.local/bin/ansible-playbook -vvvv -e user=${USER} -i ./inventory playbooks/user.yml"

c="control"
stat_container $c
[[ $? != 0 ]] && toolbox create --container $c
toolbox run --container $c bash -c "python3 -m pip install ansible --user"
#toolbox run --container $c bash -c "sudo dnf install -y ansible python2 python2-pip"
toolbox run --container $c bash -c "cd ${INSTALLDIR}/ansible && \
	${HOME}/.local/bin/ansible-galaxy install -r requirements.yml"
toolbox run --container $c bash -c "cd ${INSTALLDIR}/ansible && \
	${HOME}/.local/bin/ansible-playbook -e user=${USER} -i ./inventory playbooks/control.yml"

#
##[[ $CONTAINERSTATE == "true" ]]  && podman exec -i $c dnf install ansible
	

