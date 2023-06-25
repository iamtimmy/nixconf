{ pkgs, apple-fonts }:

with pkgs;
with apple-fonts;
{
  fontDir.enable = true;
  fonts = [
    hack-font
    sf-pro

    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  fontconfig = {
    defaultFonts = {
      monospace = [ "hack" ];
    };
  };
}