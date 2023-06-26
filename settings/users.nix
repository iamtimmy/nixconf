{ pkgs }:

{
  defaultUserShell = pkgs.zsh;

  users.admin = {
    isNormalUser = true;
    extraGroups = [ 
      "networkmanager"
      "wheel"
      "audio"
      "realtime"
      "libvirtd"
    ];
  };
}
