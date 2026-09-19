{...}: {
  flake.nixosModules.greetd = {pkgs, ...}: {
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          user = "greeter";
        };
      };
    };
    systemd.services.greetd.serviceConfig = {
      Type = "idle";
      StandardInput = "tty";
      StandardOutput = "null";
      StandardError = "journal";
      TTYReset = true;
      TTYVHangup = true;
      TTYVTDisallocate = true;
    };
  };
}
# add the below command to the DM or WM wrapper
# command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd niri-session";
