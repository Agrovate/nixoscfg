{inputs, ...}: {
  flake.nixosModules.mrvirt = {pkgs, ...}: {
    networking.hostName = "MRVIRT";

    programs.nix-ld.enable = true;

    environment.systemPackages = with pkgs; [
      inputs.swiss.packages.x86_64-linux.default
      inputs.project-maxxer.packages.x86_64-linux.default

      nautilus
    ];
  };
}
