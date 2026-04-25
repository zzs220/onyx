{pkgs, ...}:
{
  security.polkit.enable = true;
  services.tumbler.enable = true; # thumbnail

  environment.systemPackages = with pkgs; [
     wl-clipboard brightnessctl playerctl
     xarchiver zathura
  ];
}
