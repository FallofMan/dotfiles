{
  description = "Basic NixOS config flake with home-manager";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs2311.url = "nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs2311, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    nixosConfigurations = {
      # Configure nixOS-vm
      nixOS-vm = lib.nixosSystem {
        inherit system;
        modules = [ 
          ./configuration.nix
        ];
      };
    };
    homeConfigurations = {
      collin = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home.nix
        ];
      };
    };
  };
}
