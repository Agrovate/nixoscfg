{...}: {
  flake.nixosModules.ly = {pkgs, ...}: {
    services.displayManager.ly = {
      enable = true;

      settings = {
        animation = "matrix"; # Matrix effect ("doom", "matrix", "colormix")
        bigclock = true; # Enlarged text clock
        clear_password = true; # Clear input buffer on password failure
        hide_borders = false;
      };
    };
  };
}
