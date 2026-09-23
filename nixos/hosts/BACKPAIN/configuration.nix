{inputs, ...}: {
  flake.nixosModules.backpain = {pkgs, ...}: {
    networking.hostName = "BACKPAIN";

    programs.nix-ld.enable = true;

    environment.systemPackages = with pkgs; [
      inputs.zen-browser.packages.x86_64-linux.default
      inputs.swiss.packages.x86_64-linux.default
      inputs.project-maxxer.packages.x86_64-linux.default

      nautilus
      docker-compose
    ];
    virtualisation.docker = {
      enable = true;
      daemon.settings = {
        experimental = true;
        dns = ["1.1.1.1" "8.8.8.8"];
        default-address-pools = [
          {
            base = "172.30.0.0/16";
            size = 24;
          }
        ];
      };
    };
    users.users.snow.extraGroups = ["docker"];
  };
}
