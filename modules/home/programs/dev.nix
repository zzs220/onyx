{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs
    python314 python314Packages.pip uv
    rustup
  ];
}
