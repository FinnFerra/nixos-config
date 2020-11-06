{ config, pkgs, ... }:

{
  environment = {
  shells = [
    "${pkgs.bash}/bin/bash"
    "${pkgs.zsh}/bin/zsh"
   # "${pkgs.unstable.nushell}/bin/nu"
  ];
  
  systemPackages = with pkgs; [
     #Shells
     starship
     any-nix-shell
     nushell

     #zsh Tools
     zsh
     zsh-autosuggestions
     nix-zsh-completions
   ];
  };

  # Enable zsh
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [ "git" "sudo" "colored-man-pages" "command-not-found" "extract" ];
      theme = "agnoster";
    };
    shellAliases = {
      vpnon = "sudo systemctl start openvpn-vpn.service";
      vpnstatus = "sudo systemctl status openvpn-vpn.service";
      vpnoff = "sudo systemctl stop openvpn-vpn.service";
    };
  };

}