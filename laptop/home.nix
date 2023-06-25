{ pkgs, ... }:

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

    helvum
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "hx";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
  };

  #wayland.windowManager.hyperland.enable = true;
  #wayland.windowManager.hyperland.nvidiaPatches = true;
}
