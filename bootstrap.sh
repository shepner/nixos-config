#!/usr/bin/env bash

CONFIGDIR=/etc/nixos
FILENAME="configuration.nix"
file=$CONFIGDIR/$FILENAME
max_revisions=5

# Backup the OEM file before doing anything else
if [ ! -f "$file.orig" ]; then
  sudo cp $file $file.orig
fi

# Rotate the files, starting from the oldest
if [ -f "$file.$max_revisions" ]; then
  sudo rm "$file.$max_revisions"  # Remove the oldest file if it exists
fi

# Shift file versions down
for ((i=max_revisions-1; i>=1; i--)); do
  if [ -f "$file.$i" ]; then
    sudo mv "$file.$i" "$file.$((i+1))"
  fi
done

# Move the current log to version 1
if [ -f "$file" ]; then
  sudo mv "$file" "$file.1"
fi

# download the latest file
sudo curl -o $CONFIGDIR/configuration.nix https://raw.githubusercontent.com/shepner/nixos-config/refs/heads/main/configuration.nix

# Apply new config
sudo nixos-rebuild switch
