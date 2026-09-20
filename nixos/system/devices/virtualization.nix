{pkgs, ...}: {
  flake.nixosModules.virtualization = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      virt-manager
      virt-viewer
      spice
      spice-gtk
      spice-protocol
      virtio-win
      win-spice
      adwaita-icon-theme
    ];
    users.users.snow.extraGroups = ["libvirtd"];
    programs.dconf.enable = true;
    programs.virt-manager.enable = true;
    users.groups.libvirtd.members = ["snow"];
    virtualisation = {
      libvirtd = {
        enable = true;
        qemu = {
          swtpm.enable = true;
        };
      };
      spiceUSBRedirection.enable = true;
    };
    services.spice-vdagentd.enable = true;
    services.qemuGuest.enable = true;
  };
}
