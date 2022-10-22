{ pkgs, ... }:

{
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    cowsay
    neovim
    firefox
    git
    gh
    gnome.nautilus
    gnome.gnome-shell-extensions
    gnomeExtensions.appindicator
  ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      font-antialiasing = "rgba";
    };

    "org/gnome/desktop/input-sources" = { xkb-options = [ "ctrl:nocaps" ]; };
  };
}
