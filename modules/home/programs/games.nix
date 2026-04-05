{ pkgs, ... }:
{
  home.packages = with pkgs; [
    wineWow64Packages.stagingFull
    winetricks protontricks
    heroic gamescope
  ];
}
