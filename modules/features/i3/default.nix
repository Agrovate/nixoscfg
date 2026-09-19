{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.i3 = {pkgs, ...}: {
    services.xserver = {
      enable = true;
      libinput.enable = true;
      displayManager.sx.enable = true;
      windowManager.i3 = {
        enable = true;
        package =
          self.packages.${pkgs.stdenv.hostPlatform.system}.myI3;
        extraPackages = with pkgs; [
          dmenu
          i3status
          xinit
          ghostty
        ];
      };
    };
    services.greetd.settings.default_session.command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --sessions /run/current-system/sw/share/xsessions";
  };

  perSystem = {
    pkgs,
    self',
    lib,
    ...
  }: let
    inputConfig = builtins.readFile ./config;
    updatedConfig =
      builtins.replaceStrings
      ["ghostty"]
      [(lib.getExe self'.packages.myGhostty)]
      inputConfig;
    finalConfig = pkgs.writeText "i3-config" updatedConfig;
  in {
    packages.myI3 = inputs.wrapper-modules.lib.wrapPackage {
      inherit pkgs;

      package = pkgs.i3;

      runtimePkgs = with pkgs;
        [
          xrandr
          xkill
          xinit
          xauth
          xsetroot
          xorgserver
          xf86inputlibinput
          xf86inputsynaptics
        ]
        ++ [
          #self'.packages.myGhostty
        ];

      flags = {
        "-c" = finalConfig;
      };
    };
  };
}
