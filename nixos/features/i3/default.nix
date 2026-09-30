{
  moduleWithSystem,
  inputs,
  ...
}: {
  flake.nixosModules.i3 = moduleWithSystem ({self', ...}: {
    services.xserver = {
      enable = true;

      windowManager.i3 = {
        enable = true;
        package = self'.packages.i3;
      };
    };
  });

  perSystem = {
    pkgs,
    self',
    lib,
    ...
  }: let
    inputConfig =
      builtins.readFile inputs.dotfiles.i3Config;

    updatedConfig =
      builtins.replaceStrings
      ["alacritty"]
      [(lib.getExe self'.packages.myAlacritty)]
      inputConfig;

    finalConfig =
      pkgs.writeText "i3-config" updatedConfig;
  in {
    packages.i3 = inputs.wrapper-modules.lib.wrapPackage {
      inherit pkgs;

      package = pkgs.i3;

      runtimePkgs = with pkgs; [
        xrandr
        xkill
        xinit
        xauth
        xsetroot
        dmenu
        i3status
        self'.packages.myAlacritty
      ];

      flags = {
        "-c" = finalConfig;
      };
    };
  };
}
