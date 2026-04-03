{ pkgs, ... }:
{
  imports = [
    ./tailscale.nix
    ./dnscrypt-proxy.nix
  ];

  networking.hostName = "onyx";
  networking.networkmanager = {
    enable = true;
    # dns = "systemd";
  };

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

  environment.systemPackages = with pkgs; [
    wireguard-tools wgcf
  ];
}
