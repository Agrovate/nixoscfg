{
  inputs,
  moduleWithSystem,
  ...
}: {
  flake.nixosModules.zsh = moduleWithSystem ({
    pkgs,
    self',
    ...
  }: {
    nixpkgs.overlays = [
      (final: prev: {
        zsh = self'.packages.myZsh;
      })
    ];
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      enableBashCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      histSize = 10000;
    };
    users.defaultUserShell = pkgs.zsh;
    programs.starship.enable = true;
    programs.zoxide.enable = true;
    programs.zoxide.enableZshIntegration = true;
  });

  perSystem = {
    pkgs,
    lib,
    self',
    ...
  }: {
    packages.myZsh = inputs.wrapper-modules.wrappers.zsh.wrap {
      inherit pkgs;
      runtimePkgs = [pkgs.fetch pkgs.fastfetch];
      zshAliases = {
        cd = "z";
        ls = "${lib.getExe pkgs.eza} -l";
        sysupdate = "sudo nixos-rebuild switch --flake /home/snow/nixoscfg";
        vim = "${lib.getExe self'.packages.nvim}";
      };
      zshrc.content = ''
        HISTFILE="$HOME/.zsh_history"
        setopt HIST_IGNORE_ALL_DUPS
        eval "$(devenv hook zsh -- -q)"
      '';
    };
  };
}
