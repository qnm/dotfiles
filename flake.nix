{
	description = "Home Manager configuration of Rob Sharp";

	inputs ={
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";

		home-manager = {
			url = "github:nix-community/home-manager/release-22.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};

	};

	outputs = inputs @ { nixpkgs, home-manager, ... }:
		let
		system = "x86_64-linux";
	pkgs = nixpkgs.legacyPackages.${system};
	in {
		homeConfigurations.qnm = home-manager.lib.homeManagerConfiguration {
			inherit pkgs;

			system = "x86_64-linux"; 
			configuration.imports = [ ./home.nix ];
			homeDirectory = "/home/qnm"; 
			username = "qnm"; 

# Optionally use extraSpecialArgs
# to pass through arguments to home.nix
		};
	};
}
