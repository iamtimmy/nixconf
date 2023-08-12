{ pkgs }:

let
  walacritty = pkgs.runCommand "alacritty" { buildInputs = [ pkgs.makeWrapper ]; } ''
    makeWrapper ${pkgs.alacritty}/bin/alacritty $out/bin/alacritty --set WAYLAND_DISPLAY
  '';
in
{
  shells = with pkgs; [ zsh bash nushell ];

  systemPackages = with pkgs; [
    zsh
    bash
    nushell

    foot
    alacritty
    kitty

    util-linux
    busybox

    vim
  ];
}
