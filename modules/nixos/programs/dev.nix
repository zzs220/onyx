{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gcc
    gnumake
    # go
    nodejs
    python314 python314Packages.pip uv
    rustup
  ];
}
