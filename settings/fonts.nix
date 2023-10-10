{ pkgs, apple-fonts }:

with pkgs;
with apple-fonts;
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