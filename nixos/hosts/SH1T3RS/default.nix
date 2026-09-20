{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.SH1T3RS = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      # main configurations for the system
      sh1t3rs
      sh1t3rsHardware

      # Home manager but kinda usless
      myHomeManager

      # CPU and GPU drivers
      cpuAmd
      gpuAmd

      # Contains quickshell, greetd, fonts, and devices
      desktop

      # Contains boot,locale,users,nix-settings,network,audio,brightness
      core

      #Environment
      niri

      # Contains kits
      gaming
      development
    ];
  };
}
