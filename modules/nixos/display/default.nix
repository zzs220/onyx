{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment = {
    sessionVariables = {
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
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
  	waybar wofi wl-clipboard brightnessctl
    thunar thunar-volman 
	noctalia-shell noctalia-qs
  ];
}
