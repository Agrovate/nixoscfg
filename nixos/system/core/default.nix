{self, ...}: {
  flake.nixosModules.core = {...}: let
    modules = with self.nixosModules; [
      boot
      locale
      users
      nixSettings
      network
      audio
      brightness
    ];
  in {
    imports =
      [
        # /etc/nixos/hardware-configuration.nix | using --impure
      ]
      ++ modules;
  };
}
