{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.users = {
    pkgs,
    lib,
    ...
  }: {
    imports = with self.nixosModules; [zsh];
    users.users.snow = {
      initialPassword = "1234";
      isNormalUser = true;
      shell = pkgs.zsh;
      extraGroups = ["root" "wheel"];
    };

    users.users.root = {
      initialPassword = "1234";
    };

    home-manager.users.snow = self.homeModules.snowModule;
  };
}
