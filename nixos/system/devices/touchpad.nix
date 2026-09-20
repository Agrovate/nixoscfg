{ pkgs, ... }: {
  flake.nixosModules.touchpad = {pkgs,lib,...}: {
    services.libinput = {
      enable = true;
      touchpad.naturalScrolling = true;
    };

  };
}

