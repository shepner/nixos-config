# nixos-config

From:
- https://librephoenix.com/2023-10-21-intro-flake-config-setup-for-new-nixos-users.html

Edit the config file
```
nano /etc/nixos/configuration.nix
```

Update as appropriate and add the following

```
nix.settings.experimental-features = [ "nix-command" "flakes" ];

# System packages
environment.systemPackages = with pkgs; [
  vim
  wget
  zsh
  git
];
```

Then run this:

```
sudo nix-channel --update
sudo nixos-rebuild switch
```

This is how to update the system after adjusting the flake file:

```
sudo nixos-rebuild switch --flake
```

From:
- https://librephoenix.com/2024-03-14-managing-your-nixos-config-with-git#org4e1c396

```
nix run github:shepner/nixos-config
```

