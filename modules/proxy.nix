{ config, pkgs, ... }:

{
  services.openvpn.servers.vpn = {
    config = "config /home/finnlap/.config/openvpn/client2.ovpn";
    autoStart = false;
    updateResolvConf = true;
};

  environment.systemPackages = with pkgs; [
    openvpn
  ];

}