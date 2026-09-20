{...}: {
  flake.nixosModules.boot = {pkgs, ...}: {
    boot.loader = {
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        useOSProber = false;
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
    };

    boot.kernelPackages = pkgs.linuxPackages_latest;
  };
}
