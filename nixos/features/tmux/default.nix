{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.tmux = {
    pkgs,
    lib,
    ...
  }: {
    programs.tmux = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myTmux;
    };
  };

  perSystem = {
    pkgs,
    lib,
    self',
    ...
  }: {
    packages.myTmux = inputs.wrapper-modules.wrappers.tmux.wrap {
      inherit pkgs;

      terminal = "screen-256color";
      historyLimit = 10000;
      mouse = true;

      prefix = "C-a";
      baseIndex = 1;
      paneBaseIndex = 1;
      modeKeys = "vi";
      statusKeys = "vi";

      configBefore = ''

        bind c new-window -c "#{pane_currnet_path}"

        unbind '"'
        unbind %
        bind | split-window -h -c "#{pane_current_path}"
        bind - split-window -v -c "#{pane_current_path}"

        bind h select-pane -L
        bind j select-pane -D
        bind k select-pane -U
        bind l select-pane -R

        bind H resize-pane -L 5
        bind J resize-pane -D 5
        bind K resize-pane -U 5
        bind L resize-pane -R 5

      '';
    };
  };
}
