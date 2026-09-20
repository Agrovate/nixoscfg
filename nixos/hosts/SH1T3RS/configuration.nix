{inputs, ...}: {
  flake.nixosModules.sh1t3rs = {pkgs, ...}: {
    networking.hostName = "SH1T3RS";

    programs.nix-ld.enable = true;

    environment.systemPackages = with pkgs; [
      asusctl

      inputs.zen-browser.packages.x86_64-linux.default
      inputs.swiss.packages.x86_64-linux.default
      inputs.project-maxxer.packages.x86_64-linux.default

      nautilus
    ];
  };
}
