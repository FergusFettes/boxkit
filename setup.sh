#!/usr/bin/env bash

set -e

cp -r /distrobox/* ~/

(
  cd ~/
  bash zsh_install.sh --unattended
  rm .profile
  rm .zshrc
  mv ngrok /usr/local/bin
)

(
  cd ~/dotfiles
  stow zsh
  stow nvim
  stow git
)

zsh
