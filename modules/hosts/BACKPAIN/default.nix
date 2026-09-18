{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.BACKPAIN = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules;
      [
        # main configurations for the system
        backpain
        backpainHardware
        #preservation

        # Home manager but kinda usless
        myHomeManager

        # CPU and GPU drivers
        cpuIntel
        gpuIntel

        # Contains boot,locale,users,nix-settings,network,audio,brightness
        core

        #Environment
        niri

        # Contains quickshell, greetd, fonts, and devices
        desktop

        # Contains tools for development
        development
      ]
      ++ [
        inputs.disko.nixosModules.disko
        self.diskoConfigurations.backpainFileSystem
        #inputs.preservation.nixosModules.default
      ];
  };
}
