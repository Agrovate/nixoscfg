{
  description = "System Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    preservation.url = "github:nix-community/preservation";

    wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    swiss.url = "github:Agrovate/swiss";
    project-maxxer.url = "github:Agrovate/project-maxxer";
    nvim.url = "github:Agrovate/nvim";
    dotfiles.url = "path:/home/snow/dotfiles";

    quickshell = {
      url = "github:Agrovate/quickshell";
      flake = false;
    };
  };
  outputs = inputs: inputs.flake-parts.lib.mkFlake {inherit inputs;} (inputs.import-tree ./nixos);
}
