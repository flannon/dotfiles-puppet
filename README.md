To setup Fedora 30 Silverblue run the following

To configure sshd for local connectivity, and install initial
layered packages run

    sudo setup.sh

To configuer $HOME run,

    make config

Make the control container,

    toolbox create --container control

Connect to control and run ansible,

    toolbox enter -c control
    make build
