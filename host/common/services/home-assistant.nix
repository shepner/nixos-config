{ pkgs, inputs, ... }:
{
  # Always use module from unstable
  disabledModules = [ "services/home-automation/home-assistant.nix" ];
  imports = [
    "${inputs.unstable}/nixos/modules/services/home-automation/home-assistant.nix"
  ];

  services.home-assistant = {
    enable = true;
    openFirewall = true;
    package = pkgs.unstable.home-assistant;
    extraComponents = [
      "apple_tv"
      "brother"
      "default_config"
      "ipp"
      "met"
      "otbr"
      "ring"
      "roomba"
      "snmp"
      "sonos"
      "touchline_sl"
      "tplink"
      "tplink_tapo"
      "unifi"
      "unifiprotect"
      "upnp"
      "webostv"
    ];
    customComponents = [
      pkgs.unstable.home-assistant-custom-components.solis-sensor
    ];
    config = {
      default_config = { };
      http = {
        trusted_proxies = [
          "::1"
          "127.0.0.1"
        ];
        use_x_forwarded_for = true;
      };
    };
  };
}
