{...}: {
  flake.nixosModules.nixSettings = {...}: {
    nix = {
      settings = {
        experimental-features = ["nix-command" "flakes"];
        trusted-users = ["root" "snow"];
      };

      optimise.automatic = true;
      gc = {
        automatic = true;
        dates = "daily";
        options = "--delete-older-than 5d";
      };
    };
    nixpkgs.config.allowUnfree = true;
    documentation.dev.enable = true;
    services.dbus.enable = true;

    system.stateVersion = "25.11";
  };
}
