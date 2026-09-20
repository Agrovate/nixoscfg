{...}: {
  flake.nixosModules.direnv = {...}: {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
      silent = true;
      enableZshIntegration = true;
      settings = {
        global = {
          hide_env_diff = true;
        };
      };
    };
  };
}
