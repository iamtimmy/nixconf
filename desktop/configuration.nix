{ pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./virtualisation.nix
      ./gnome.nix
    ];

  # boot.kernelParams = [ "amd_pstate=active" ];
  powerManagement.cpuFreqGovernor = "performance";
  hardware.cpu.amd.updateMicrocode = true;

  # boot.kernelPackages = pkgs.linuxPackages_latest;
  # boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;

  boot.kernelPackages = pkgs.linuxPackages-rt_latest;

  boot.kernelModules = [ "snd-seq" "snd-rawmidi" ]; # "winesync"
  boot.blacklistedKernelModules = [ "amdgpu" "snd_hda_intel" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  boot.initrd.luks.devices."luks-0f094e65-9e27-448f-82da-cfb754446f10".device = "/dev/disk/by-uuid/0f094e65-9e27-448f-82da-cfb754446f10";
  boot.initrd.luks.devices."luks-0f094e65-9e27-448f-82da-cfb754446f10".keyFile = "/crypto_keyfile.bin";

  time.timeZone = "Europe/Amsterdam";
  networking.hostName = "desktop";
  networking.networkmanager.enable = true;

  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  xdg.sounds.enable = true;
  xdg.portal.enable = true;

  hardware.nvidia.modesetting.enable = true;

  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;
  hardware.opengl.extraPackages = with pkgs; [
    vaapiVdpau
  ];

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  security.pam.loginLimits = [
    { domain = "@audio"; item = "memlock"; type = "-"; value = "unlimited"; }
    { domain = "@audio"; item = "rtprio"; type = "-"; value = "99"; }
    { domain = "@audio"; item = "nofile"; type = "soft"; value = "99999"; }
    { domain = "@audio"; item = "nofile"; type = "hard"; value = "99999"; }
  ];

  hardware.pulseaudio.enable = false;

  services.ratbagd.enable = true; # mouse config service

  system.stateVersion = "23.05";
}
