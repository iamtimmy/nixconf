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

    steam

    piper

    helvum
    qjackctl
    pavucontrol

    tidal-hifi
    spotify

    firefox
    brave
  ];

  home.file = dotfiles // {
  };

  home.sessionVariables = {
    EDITOR = "hx";
    BROWSER = "firefox";
    TERMINAL = "kitty";
  };
}
