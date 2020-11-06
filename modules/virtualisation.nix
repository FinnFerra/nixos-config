{ config, pkgs, ... }:

{

  # VirtualBox section
  virtualisation.virtualbox.host.enable = true;

  # Libvirtd section
  boot.kernelModules = [ "kvm-intel" ];
  virtualisation.libvirtd = {
    enable = true;
    qemuOvmf = true;
    qemuRunAsRoot = false;
    onBoot = "ignore";
    onShutdown = "shutdown";
  };
  virtualisation.podman.enable = true;
  virtualisation.podman.dockerCompat = true;

  environment.systemPackages = with pkgs; [
    #Libvirtd
    qemu
    virtmanager
      
];
}