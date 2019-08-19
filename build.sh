cd ansible
ansible-galaxy install -r requirements.yml
ansible-playbook -e user=$(whoami) -i ./inventory playbooks/main.yml
cd -

# Load vim plugins
#vim +PluginInstall +qall

# set vim as the git editor
#git config --global core.editor $(which vim)
