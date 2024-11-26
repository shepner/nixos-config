{ pkgs, ... }:

{

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # List packages installed in system profile. To search, run `nix search wget`

  environment.systemPackages = with pkgs; [
    wget
    vim
    git
    docker_27
    obsidian
    qemu
    google-chrome
    firefox
    slack
    cifs-utils
    virt-manager
  ];
}
