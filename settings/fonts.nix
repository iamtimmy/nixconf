{ pkgs }:

with pkgs;
{
  fontDir.enable = true;
  packages = [
    hack-font

    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  fontconfig = {
    defaultFonts = {
      monospace = [ "hack" ];
    };
  };
}