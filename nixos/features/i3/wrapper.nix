{inputs, ...}: {
  flake.wrapperModules.i3 = inputs.wrapper-modules.lib.evalModule (
    {wlib, ...}: {
      imports = [
        wlib.modules.default
      ];

      package = {
        inherit (inputs.nixpkgs.legacyPackages.x86_64-linux) i3;
      };

      runtimePkgs = [
        inputs.nixpkgs.legacyPackages.x86_64-linux.xrandr
      ];

      flags = {
        "-c" = ./config;
      };
    }
  );
}
