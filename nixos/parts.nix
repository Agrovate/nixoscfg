{
  self,
  inputs,
  ...
}: {
  imports = [
    inputs.home-manager.flakeModules.home-manager
    inputs.disko.flakeModules.default
  ];
  systems = [
    "x86_64-linux"
    "x86_64-darwin"
    "aarch64-linux"
    "aarch64-darwin"
  ];
}
