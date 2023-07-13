URL := "ghcr.io/"
NAMESPACE := "fergusfettes"
IMAGE := "boxkit"
TAG := "latest"
FULL_IMAGE := URL + NAMESPACE + "/" + IMAGE + ":" + TAG

build:
  docker build . -f Containerfile -t {{ URL }}{{ NAMESPACE }}/{{ IMAGE }}:{{ TAG }}

pull:
  docker pull {{ FULL_IMAGE }}

push:
  docker push {{ FULL_IMAGE }}

image:
  echo {{ FULL_IMAGE }}

login:
  source ~/pa/ghcr && echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin

new_token:
  echo Get a new token here https://github.com/settings/tokens/new?scopes=write:packages

# Note: env vars need to be set first, aka `just TAG=123 image`