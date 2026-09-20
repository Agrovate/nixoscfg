{self, ...}: {
  flake.nixosModules.desktop = {pkgs, ...}: {
    imports = with self.nixosModules; [
      devices
      quickshell
      ly
      fonts
    ];

    xdg.portal = {
      enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-gtk];
      config.common.default = ["gtk"];
    };
  };
}
