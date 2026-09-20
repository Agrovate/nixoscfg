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
#services.greetd.settings.default_session.command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd startx";
#services.greetd.settings.default_session.command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd niri-session";
#services.greetd.settings.default_session.command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --sessions /run/current-system/sw/share/xsessions";
# add the below command to the DM or WM wrapper
# command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd niri-session";

