{
  self,
  inputs,
  ...
}: {
  flake.homeConfigurations.snow = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs {system = "x86_64-linux";};
    modules = [
      self.homeModules.snowModule
      {
        home.username = "snow";
        home.homeDirectory = "/home/snow";
      }
    ];
  };

  flake.homeModules.snowModule = {pkgs, ...}: {
    home.stateVersion = "25.11";

    home.packages = with pkgs; [
      btop
      unzip
      zip
      ripgrep
      fzf
      bat
      gh
      viu
      yazi
      tdf
    ];

    imports = [
      ../../../home-manager/direnv.nix
      ../../../home-manager/yazi.nix
    ];

    programs = {
      home-manager.enable = true;
      zoxide.enable = true;
      zoxide.enableZshIntegration = true;
    };
  };
}
