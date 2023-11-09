all: install

install:
	echo "Updating..."
	apt-get update
	echo "Updated\n\nUpgrading..."
	-apt-get upgrade -y
	echo "Upgraded\n\nAdding ET package..."
	-apt-get install -y software-properties-common
	add-apt-repository ppa:jgmath2000/et -y
	apt-get update
	echo "Added ET package\n\nInstalling packages..."
	-apt-get install -y podman podman-toolbox mosh et
	echo "Installed packages\n\nInstalling snaps..."
	snap install ngrok
	snap install --edge --classic just
