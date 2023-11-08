URL := "ghcr.io/"
NAMESPACE := "fergusfettes"
IMAGE := "boxkit"
TAG := "latest"
FULL_IMAGE := URL + NAMESPACE + "/" + IMAGE + ":" + TAG
BOXTOOL := "toolbox" # or "distrobox"

# Note: env vars need to be set first, aka `just TAG=123 image`

install2:
  apt-get update
  apt-get upgrade -y
  apt-get install -y software-properties-common
  add-apt-repository ppa:jgmath2000/et
  apt-get update
  apt-get install -y podman podman-docker mosh et
  snap install ngrok
  snap install --edge --classic just

install:
  sudo apt-get install podman podman-toolbox

build:
  podman build . -f Containerfile.{{ IMAGE }} -t {{ URL }}{{ NAMESPACE }}/{{ IMAGE }}:{{ TAG }}

pull:
  podman pull {{ FULL_IMAGE }}

push:
  podman push {{ FULL_IMAGE }}

image:
  echo {{ FULL_IMAGE }}

login:
  cat ~/pa/ghcr | podman login ghcr.io -u fergusfettes --password-stdin

new_token:
  echo Get a new token here https://github.com/settings/tokens/new?scopes=write:packages

create:
  {{ BOXTOOL }} create -i {{ FULL_IMAGE }}

delete:
  {{ BOXTOOL }} rm -f {{ IMAGE }}-{{ TAG }}

enter:
  {{ BOXTOOL }} enter {{ IMAGE }}-{{ TAG }}

stop:
  podman stop {{ IMAGE }}-{{ TAG }}
