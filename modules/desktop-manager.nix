{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # OpenGL
  hardware.opengl.driSupport32Bit = true;

  # Enable Gnome desktop Environment
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome3.enable = true;

  services.redshift.enable = true;
  location.latitude = 46.0;
  location.longitude = 24.0;

  environment.systemPackages = with pkgs; [
    xorg.xkill
    redshift

    # Gnome desktop
    gnome3.gnome-boxes
    gnome3.polari
    gnome3.dconf-editor
    gnome3.gnome-tweaks
    gnomeExtensions.impatience
    gnomeExtensions.dash-to-dock
    gnomeExtensions.dash-to-panel
    # unstable.gnomeExtensions.tilingnome #broken
    gnomeExtensions.system-monitor

    #themes
    numix-cursor-theme
    bibata-cursors
    capitaine-cursors
    equilux-theme
    materia-theme
    nordic
    paper-gtk-theme
    paper-icon-theme
    papirus-icon-theme
    plata-theme
    sierra-gtk-theme

  ];

  fonts.fonts = with pkgs; [
    fira-code
    fira
    cooper-hewitt
    ibm-plex
    fira-code-symbols
    powerline-fonts
  ];
  
  services.xserver.videoDrivers = [ "modesetting" "nvidiaLegacy450" ];
  hardware.nvidia.prime = {
    sync.enable = true;

    # Bus ID of the NVIDIA GPU. You can find it using lspci, either under 3D or VGA
    nvidiaBusId = "PCI:1:0:0";

    # Bus ID of the Intel GPU. You can find it using lspci, either under 3D or VGA
    intelBusId = "PCI:0:2:0";
  };

}