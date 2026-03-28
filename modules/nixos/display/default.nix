{ pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment = {
    sessionVariables = {
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      QT_QPA_PLATFORMTHEME = "qt6ct";
    };
  };

  security.polkit.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
        xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
    ];
  };

  environment.systemPackages = with pkgs; [
  	waybar wofi wl-clipboard brightnessctl hyprpolkitagent
    noctalia-shell noctalia-qs
    nwg-look adw-gtk3 papirus-icon-theme kdePackages.qt6ct
    kdePackages.kde-gtk-config
    thunar xarchiver
  ];
}
