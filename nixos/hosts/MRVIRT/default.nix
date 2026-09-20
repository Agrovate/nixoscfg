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
        mrvirtHardware

        # Home manager but kinda usless
        myHomeManager

        # Contains boot,locale,users,nix-settings,network,audio,brightness
        core

        # Contains quickshell, greetd, fonts, and devices
        desktop

        #Environment
        i3
      ]
      ++ [
        inputs.disko.nixosModules.disko
        self.diskoConfigurations.mrvirt
      ];
  };
}
