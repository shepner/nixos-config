{ config, pkgs, ... }:

{
# Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.shepner = {
    isNormalUser = true;
    description = "Stephen Hepner";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };
}
