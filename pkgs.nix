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
    docker_27
    obsidian
    google-chrome
    firefox
    slack
    #
    qemu
    libvirt
    virt-manager
  ];
}
