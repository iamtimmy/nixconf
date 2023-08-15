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

    eww-wayland
    hyprpaper
    libsForQt5.polkit-kde-agent
    dunst
    rofi-wayland
    
    firefox
    tidal-hifi
    spotify

    helvum
    pavucontrol
  ];

  home.file = dotfiles // {
    ".config/rofi/config.rasi".source = ./dotfiles/rofi/config.rasi;
    ".config/hypr/hyprland.conf".source = ./dotfiles/hypr/hyprland.conf;
    ".config/hypr/hyprpaper.conf".source = ./dotfiles/hypr/hyprpaper.conf;
    ".config/hypr/wallpaper.jpg".source = ../dotfiles/wallpapers/1.jpg;
  };

  home.sessionVariables = {
    EDITOR = "hx";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
  };
}
