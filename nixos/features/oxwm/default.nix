{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.oxwm = {pkgs, ...}: {
    services.xserver = {
      enable = true;
      desktopManager.xterm.enable = false;
      windowManager.oxwm.enable = true;
    };

    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.myOxwm
      pkgs.ghostty
    ];
  };

  perSystem = {
    pkgs,
    self',
    ...
  }: {
    packages.myOxwm = inputs.wrapper-modules.lib.wrapPackage {
      inherit pkgs;

      package = pkgs.oxwm;

      runtimePkgs = with pkgs;
        [
          xrandr
          dmenu
        ]
        ++ [
          self'.packages.myGhostty
          ghostty
        ];

      flags = {
        "--config" = ./config.lua;
      };
    };
  };
}
