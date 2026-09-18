{
  inputs,
  moduleWithSystem,
  ...
}: {
  flake.nixosModules.i3 = moduleWithSystem ({
    pkgs,
    self',
    ...
  }: {
    services.xserver = {
      enable = true;

      desktopManager.xterm.enable = false;

      windowManager.i3 = {
        enable = true;
        package = self'.packages.i3;

        extraPackages = with pkgs; [
          dmenu
          i3status
          xinit
        ];
      };
    };
  });

  perSystem = { pkgs, self', ... }: {
    packages.i3 = inputs.wrapper-modules.wrappers.i3.wrap {
      inherit pkgs;

      package = pkgs.i3;

      runtimePkgs = with pkgs; [
        xrandr
      ] ++ (with self'.packages; [
        ghostty
      ]);

      flags = {
        "-c" = ./config;
      };
    };
  };
}

