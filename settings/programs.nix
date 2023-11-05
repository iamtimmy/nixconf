{
  zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      theme = "agnoster";
      plugins = [
        "sudo"
        "git"
      ];
    };
  };

  adb.enable = true;
}
