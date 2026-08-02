{ pkgs, ... }:
{
  home.packages = with pkgs; [
    mpv
    readest
    ffmpeg
  ];
}
