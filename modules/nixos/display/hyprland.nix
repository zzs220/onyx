{pkgs, ...}:

{
  imports = [
    ./hyprland/noctalia.nix
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
    ];
  };

  environment.systemPackages = with pkgs; [
    hyprpolkitagent hyprshutdown
    kdePackages.kde-gtk-config
    thunar thunar-archive-plugin
  ];

  programs.thunar = with pkgs; {
    enable = true;
    plugins =  with pkgs; [
      thunar-archive-plugin
    ];
  };
}
