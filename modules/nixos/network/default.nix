{ pkgs, ... }:
{
  networking.hostName = "onyx";
  networking.networkmanager = {
    enable = true;
    # dns = "systemd";
  };

  services = {
    # Enable NetworkManager dispatcher for scripts
    # network-manager-applet.enable = true;
  };
  environment.systemPackages = with pkgs; [
	  wireguard-tools wgcf
  ];

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };
}
