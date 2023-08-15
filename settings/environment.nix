{ pkgs }:

{
  shells = with pkgs; [ zsh bash nushell ];

  systemPackages = with pkgs; [
    zsh
    bash
    nushell

    util-linux
    busybox
    bat
    ripgrep
    wget 
    git
    gh

    vim
    helix
  ];
}
