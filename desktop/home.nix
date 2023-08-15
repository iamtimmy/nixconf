{ pkgs, ... }:

let
  dotfiles = import ../dotfiles/default.nix;
in
{
  home.username = "admin";
  home.homeDirectory = "/home/admin";
  home.stateVersion = "23.05";
  programs.home-manager.enable = true;

  programs.kitty = {
    enable = true;
    font = {
      size = 12;
      name = "Hack";
    };
    theme = "Gruvbox Dark Hard";
  };

  home.packages = with pkgs; [
    starship

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
    TERMINAL = "kitty";
  };
}
