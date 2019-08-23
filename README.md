To setup Fedora 30 Silverblue run the following

To configure sshd for local connectivity, and install initial
layered packages run

    sudo setup.sh

To configuer $HOME run,

    make config

Make the control and $USER containers,

	build.sh

Connect to control and run the configure script,

	cd ~/.dotfiles
        ./configure_toolbox.sh control

Connect to $USER  and run the configure script,

	cd ~/.dotfiles
        ./configure_toolbox.sh $USER
