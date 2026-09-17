{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.MRVIRT = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules;
      [
        # main configurations for the system
        mrvirt

        # Home manager but kinda usless
        myHomeManager

        # CPU and GPU drivers
        cpuIntel
        gpuIntel

        # Contains boot,locale,users,nix-settings,network,audio,brightness
        core

        # Contains quickshell, greetd, fonts, and devices
        desktop

        #Environment
        niri

        # Contains tools for development
        development
      ]
      ++ [
        self.diskoConfigurations.mrvirtFileSystem
        ./_hardware.nix
      ];
  };
}
