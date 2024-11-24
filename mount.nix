{ config, pkgs, ... }:

{
  
  # https://nixos.wiki/wiki/Samba#Samba_Client
  # For mount.cifs, required unless domain name resolution is not needed.
  #environment.systemPackages = [ pkgs.cifs-utils ];
  fileSystems."/mnt/media" = {
    device = "//nas.asyla.org/media";
    fsType = "cifs";
    options = let
      # this line prevents hanging on network split
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
    in ["${automount_opts},credentials=/etc/nixos/smb-secrets"];
  };
  # `/etc/nixos/smb-secrets` (domain is optional)
  # ```
  # username=<USERNAME>
  # domain=<DOMAIN>
  # password=<PASSWORD>
  # ```

}
