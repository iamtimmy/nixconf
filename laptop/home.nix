{ pkgs, ... }:

let
  dotfiles = import ../dotfiles/default.nix;
in
{
  home.username = "admin";
  home.homeDirectory = "/home/admin";
  home.stateVersion = "23.05";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    helix
    starship

    bat
    ripgrep
    
    wget 
    git
    gh
    neofetch

    dunst
    rofi-wayland
    
    firefox
    tidal-hifi
    spotify

    helvum
  ];

  home.file = dotfiles // {
    ".config/hypr/hyprland.conf".source = ./dotfiles/hypr/hyprland.conf;
  };

  home.sessionVariables = {
    EDITOR = "hx";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
  };
}
