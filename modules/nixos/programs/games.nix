{ pkgs, ... }:
{
  services = {
    udev = {
      packages = with pkgs; [
        game-devices-udev-rules # controller compat
      ];
    };
  };
  environment.systemPackages = with pkgs; [
    wineWow64Packages.stagingFull
    winetricks protontricks
    heroic gamescope
  ];
}
