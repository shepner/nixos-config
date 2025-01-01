{ pkgs, ... }:

{

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # List packages installed in system profile. To search, run `nix search wget`

  environment.systemPackages = with pkgs; [
    cifs-utils
    wget
    vim
    #
    strawberry
    #
    git
    sublime-merge
    #
    bitwarden-desktop
    #
    google-chrome
    slack
    #
    obsidian
    firefox
    #
    docker_27
    #
    qemu
    libvirt
    virt-manager
  ];
}
