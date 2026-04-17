{pkgs, ...}:

{
  services.udev.packages = with pkgs; [
    game-devices-udev-rules # fix game controller compat
  ];
}
