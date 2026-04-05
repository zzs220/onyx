{pkgs, ...}:

{
  imports = [
    ./hyprland/noctalia.nix
  ];

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
    wl-clipboard brightnessctl hyprpolkitagent
    kdePackages.kde-gtk-config
    thunar xarchiver
    zathura
  ];

  services.tumbler.enable = true; # thumbnail
  programs.thunar = with pkgs; {
    enable = true;
    plugins =  with pkgs; [
      thunar-archive-plugin
    ];
  };
}
