{ pkgs }:

let
  walacritty = pkgs.runCommand "alacritty" { buildInputs = [ pkgs.makeWrapper ]; } ''
    makeWrapper ${pkgs.alacritty}/bin/alacritty $out/bin/alacritty --set WAYLAND_DISPLAY
  '';
in
{
  shells = with pkgs; [ zsh bash nushell ];

  systemPackages = with pkgs; [
    foot
    alacritty
    kitty

    zsh
    bash
    nushell

    vim
    util-linux
  ];
}
