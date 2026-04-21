{ pkgs, ... }:
{
  imports = [
    ./ssh.nix
    ./tailscale.nix
    ./dnscrypt-proxy.nix
  ];

  networking.hostName = "onyx";
  networking.networkmanager = {
    enable = true;
    # dns = "systemd";
  };
  environment.systemPackages = with pkgs; [
    wireguard-tools wgcf
  ];
}
