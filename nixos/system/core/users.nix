{ self,inputs,...}: {
  flake.nixosModules.users = { pkgs,lib,...}: {
    imports = with self.nixosModules; [ zsh ];
    users.users.snow = {
      initialPassword = "1234";
      isNormalUser = true;
      shell = pkgs.zsh;
      extraGroups = [ "root" "wheel" ];
    };

    users.users.root = {
      initialPassword = "1234";
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFIooUCatWY24o5rNNYfaUKcDVE/wNvaUp+vhYRvyR2h agrovate@cachyos-x8664"
      ];
    };

    home-manager.users.snow = self.homeModules.snowModule;
  };
}

