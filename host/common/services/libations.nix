{ config, self, ... }:
{
  age.secrets = {
    libations-auth-key = {
      file = "${self}/secrets/thor-libations-tskey.age";
      owner = "root";
      group = "root";
      mode = "400";
    };

    libations-recipes = {
      file = "${self}/secrets/thor-libations-recipes.age";
      owner = "root";
      group = "root";
      mode = "444";
    };
  };

  services.libations = {
    enable = true;
    recipesFile = config.age.secrets.libations-recipes.path;
    tailscaleKeyFile = config.age.secrets.libations-auth-key.path;
  };
}
