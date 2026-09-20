{
  self,
  inputs,
  moduleWithSystem,
  ...
}: {
  flake.nixosModules.ghostty = moduleWithSystem ({
    pkgs,
    self',
    ...
  }: {
    environment.systemPackages = with self'.packages; [
      myGhostty
    ];
  });
  perSystem = {
    pkgs,
    lib,
    self',
    ...
  }: {
    packages.myGhostty = inputs.wrapper-modules.wrappers.ghostty.wrap {
      inherit pkgs;
      settings = {
        theme = "Nord";
        window-decoration = false;
        confirm-close-surface = false;
        font-family = "MesloLGS Nerd Font Mono Regular";
        background-opacity = 0.8;
      };
    };
  };
}
