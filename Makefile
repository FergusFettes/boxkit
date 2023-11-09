all: install

install:
	echo "Updating..."
	apt-get update
	echo "Updated\n\Upgrading..."
	-apt-get upgrade -y
	echo "Upgraded\n\Adding ET package..."
	apt-get install -y software-properties-common
	add-apt-repository ppa:jgmath2000/et
	apt-get update
	apt-get install -y podman podman-docker mosh et
	snap install ngrok
	snap install --edge --classic just
