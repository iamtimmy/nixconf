{ pkgs, ... }:

{
  boot.kernelParams = [
    "amd_iommu=on"
    "iommu=pt"
    "vfio_iommu_type1.allow_unsafe_interrupts=1"
    "pcie_aspm=off"
  ];

  boot.kernelModules = [ "vfio_virqfd" "vfio_pci" "vfio+iommutype1" "vfio" ];
  boot.extraModprobeConfig = ''
    options vfio-pci ids=1002:699f,1002:aae0
    options snd_usb_audio vid=0x1235 pid=0x8210 device_setup=1
  '';

  virtualisation.libvirtd = {
    enable = true;
    qemu.ovmf.enable = true;
  };

  # systemd.tmpfiles.rules = [
  #  "f /dev/shm/looking-glass 0660 admin qemu-libvirtd -"
  # ];

  networking.firewall.allowedUDPPorts = [ 4010 ];
  
  systemd.user.services.scream = {
    description = "scream client service";
    serviceConfig.PassEnvironment = "DISPLAY";
    script = "${(pkgs.scream.override { jackSupport = true; })}/bin/scream -i virbr0 -o jack";
    wantedBy = [ "multi-user.target" ];
  };

  environment.systemPackages = with pkgs; [
    virt-manager
  ];
}