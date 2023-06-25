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

    firefox
    tidal-hifi
    spotify

    steam

    piper

    helvum
    qjackctl
    pavucontrol
  ];

  home.file = dotfiles // {
  };

  home.sessionVariables = {
    EDITOR = "hx";
    BROWSER = "firefox";
    TERMINAL = "foot";
  };

  
  # xdg.desktopEntries = {
  #   alacritty = {
  #     name = "Alacritty";
  #     exec = "alacritty";
  #   };
  # };
}
