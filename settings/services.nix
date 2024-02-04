{ pkgs, ... }:

{
  xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  fstrim.enable = true; # make better ssd support&lifetime
  gvfs.enable = true;
  usbmuxd = {
    enable = true;
    package = pkgs.usbmuxd2;
  };
}
