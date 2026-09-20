{
  inputs,
  moduleWithSystem,
  ...
}: {
  flake.nixosModules.alacritty = moduleWithSystem ({self', ...}: {
    environment.systemPackages = with self'.packages; [
      myAlacritty
    ];
  });
  perSystem = {pkgs, ...}: {
    packages.myAlacritty = inputs.wrapper-modules.wrappers.alacritty.wrap {
      inherit pkgs;
      settings = {
        window = {
          opacity = 0.85;
          blur = true;
          padding = {
            x = 12;
            y = 12;
          };
          dynamic_padding = true;
          decorations = "None";
        };

        cursor.style.shape = "Block";
        general.live_config_reload = true;

        font = {
          size = 12;
          normal = {
            family = "Iosevka Nerd Font Mono";
            style = "Regular";
          };
        };
        colors = {
          primary = {
            background = "#232831";
            foreground = "#b9c2c3";
            dim_foreground = "#a9b1d6";
          };

          cursor = {
            text = "#232831";
            cursor = "#a3b8ef";
          };
          selection = {
            text = "CellForeground";
            background = "#3e4a5b";
          };

          normal = {
            black = "#2e3440";
            red = "#c94f6d";
            green = "#81b29a";
            yellow = "#dbc074";
            blue = "#719cd6";
            magenta = "#9d79d6";
            cyan = "#63cdcf";
            white = "#dfeded";
          };

          bright = {
            black = "#3b4252";
            red = "#d16982";
            green = "#8fbcbb";
            yellow = "#e0af68";
            blue = "#8bc2f3";
            magenta = "#a485dd";
            cyan = "#7dcfff";
            white = "#e5e9f0";
          };
        };
      };
    };
  };
}
