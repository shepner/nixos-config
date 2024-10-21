#!/usr/bin/env bash

CONFIGDIR=/etc/nixos

sudo mv $CONFIGDIR/configuration.nix $CONFIGDIR/configuration.nix.orig
sudo curl -o $CONFIGDIR/configuration.nix https://raw.githubusercontent.com/shepner/nixos-config/refs/heads/main/configuration.nix

sudo nixos-rebuild switch
