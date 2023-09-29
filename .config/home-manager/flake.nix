{
  description = "Home Manager configuration of qnm";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    flatpaks.url = "github:GermanBread/declarative-flatpak/stable";
  };

  outputs = { nixpkgs, home-manager, flatpaks, ... }:
    let
      mkHomeConfig = system: home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
        };

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          # flatpaks.homeManagerModules.default
          ./home.nix
        ];
      };
    in {
      homeConfigurations."qnm@macbook" = mkHomeConfig "aarch64-darwin";
      homeConfigurations."qnm@desktop" = mkHomeConfig "x86_64-linux";
      homeConfigurations."qnm@pop-os" = mkHomeConfig "x86_64-linux";
    };
}
