{ pkgs, ... }:
{
  home.packages = with pkgs; [
    mpv
    ffmpeg
  ];
}
