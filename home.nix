{ pkgs, ... }:

{
	programs.home-manager.enable = true;

	home.packages = with pkgs; [
		cowsay
			neovim
			firefox
			git
			gh
	];
}
