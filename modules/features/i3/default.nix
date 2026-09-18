{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.i3 = {pkgs, ...}: {
    services.xserver = {
      enable = true;

      desktopManager.xterm.enable = false;

      windowManager.i3 = {
        enable = true;

        package =
          self.packages.${pkgs.stdenv.hostPlatform.system}.myI3;

        extraPackages = with pkgs; [
          dmenu
          i3status
          xinit
        ];
      };
    };

    services.greetd.settings.default_session.command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd ${self.packages.${pkgs.stdenv.hostPlatform.system}.myI3}/bin/i3";
  };

  perSystem = {
    pkgs,
    self',
    ...
  }: {
    packages.myI3 = inputs.wrapper-modules.lib.wrapPackage {
      inherit pkgs;

      package = pkgs.i3;

      runtimePkgs = with pkgs;
        [
          xrandr
        ]
        ++ [
          self'.packages.myGhostty
        ];

      flags = {
        "-c" = ./config;
      };
    };
  };
}
