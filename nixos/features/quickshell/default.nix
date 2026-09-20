{moduleWithSystem,inputs,...}: {
  flake.nixosModules.quickshell = moduleWithSystem ({self',pkgs,...}: {
    environment.systemPackages = with self'.packages; [
      myBar
    ];
  });
  perSystem = {pkgs, ...}: {
    packages.myBar = inputs.wrapper-modules.wrappers.quickshell.wrap {
      inherit pkgs;
      configDir = inputs.quickshell;
    };
  };
}
